function fish_user_key_bindings
    # Clear the current line with Ctrl-c
    if using_vi_key_bindings
        bind -M default -m insert \cc kill-whole-line repaint
        bind -M insert \cc kill-whole-line repaint
    else
        bind \cc kill-whole-line repaint
    end

    # Ctrl-s prepends 'sudo' to the current/previous command
    function prepend_command
        if test -z (commandline)
            commandline -r $history[1]
        end
        set -l old_cursor (commandline -C)
        commandline -C 0
        commandline -i "$argv "
        commandline -C (math $old_cursor + (string length "$argv "))
    end
    bind -M default \cs 'prepend_command sudo'
    bind -M insert \cs 'prepend_command sudo'

    # Binding for '!!'
    function bind_bang
        switch (commandline -t)[-1]
            case '!'
                commandline -t $history[1]
            case '*'
                commandline -i !
        end
    end

    # Binding for '!$'
    function bind_dollar
        switch (commandline -t)[-1]
            case '!'
                commandline -t ''
                commandline -f history-token-search-backward
            case '*'
                commandline -i '$'
        end
    end

    # Binding for '&&'
    function bind_ampersand
        set -l command (commandline)
        set -l command_to_cursor (commandline -c)
        set -l old_cursor (commandline -C)
        switch (string sub -s -2 $command_to_cursor)
            case ' &'
                set -l front (string sub -l (math $old_cursor - 2) $command_to_cursor)
                set -l back (string sub -s (math $old_cursor + 1) $command)
                commandline "$front; and$back"
                commandline -C (math $old_cursor + 3)
            case '*'
                commandline -i '&'
        end
    end

    # Binding for '||'
    function bind_pipe
        set -l command (commandline)
        set -l command_to_cursor (commandline -c)
        set -l old_cursor (commandline -C)
        switch (string sub -s -2 $command_to_cursor)
            case ' |'
                set -l front (string sub -l (math $old_cursor - 2) $command_to_cursor)
                set -l back (string sub -s (math $old_cursor + 1) $command)
                commandline "$front; or$back"
                commandline -C (math $old_cursor + 2)
            case '*'
                commandline -i '|'
        end
    end

    # Bind bash compatibility when inserting
    if using_vi_key_bindings
        bind -M insert ! bind_bang
        bind -M insert '$' bind_dollar
        bind -M insert '&' bind_ampersand
        bind -M insert '|' bind_pipe
    else
        bind ! bind_bang
        bind '$' bind_dollar
        bind '&' bind_ampersand
        bind '|' bind_pipe
    end
end
