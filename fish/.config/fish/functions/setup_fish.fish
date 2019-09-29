function setup_fish --description 'Sets up universal variables and preferences'
    echo 'Starting setup_fish...'

    # Bootstrap Fisher installation
    #------------------------------
    if not functions -q fisher
        echo '...installing Fisher'
        curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
        fish -c fisher
    end

    # User paths
    #-----------
    echo '...setting user paths'
    set new_user_paths \
        $HOME/.local/bin \
        $HOME/.cargo/bin \
        $HOME/go/bin \
        /usr/local/sbin \
        /usr/local/bin
    for x in $new_user_paths
        if not contains $x $PATH && not contains $x $fish_user_paths && test -d $x
            set -U fish_user_paths $fish_user_paths $x
        end
    end

    # Environment variables
    #----------------------
    echo '...setting environment variables'
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    # Paths to find C/C++ headers
    # set -Ux CPATH $HOME/.local/include /usr/local/include /usr/include
    # set -Ux CPPFLAGS "-I$HOME/.local/include -I/usr/local/include -I/usr/include"
    # Paths to find static libraries
    # set -Ux LIBRARY_PATH $HOME/.local/lib /usr/local/lib /usr/lib
    # set -Ux LDFLAGS "-L/usr/local/lib -L/usr/lib"
    # Paths to find dynamic libraries
    # set -Ux LD_LIBRARY_PATH $LIBRARY_PATH
    # Paths in which pkg-config will search for its .pc files
    # set -Ux PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig /usr/local/lib/pkgconfig /usr/lib/pkgconfig

    # Clear fish greeting
    #--------------------
    echo '...clearing greeting'
    set -U fish_greeting

    # Fish colors
    #------------
    echo '...setting colors'
    setup_fish_colors

    # Vi mode
    #--------
    echo '...setting vi mode'
    # Configure cursors for vi modes
    set -U fish_cursor_defaut block
    set -U fish_cursor_insert line
    set -U fish_cursor_visual block
    set -U fish_cursor_replace_one underscore
    set -U fish_cursor_unknown block
    # Shorten esxape delay to minimum
    set -U fish_escape_delay_ms 10
    # Hybrid vi mode, retains emacs bindings
    set -U fish_key_bindings fish_hybrid_key_bindings

    # Abbreviations
    #--------------
    echo '...setting abbreviations'
    abbr -a n 'nvim'
    abbr -a vi 'nvim'
    abbr -a vim 'nvim'
    abbr -a be 'bundle exec'
    abbr -a os 'overmind start'
    abbr -a oc 'overmind connect'
    abbr -a tf 'terraform'
    abbr -a kc 'kubectl'
    abbr -a serve 'ruby -run -ehttpd . -p 8888'
    abbr -a owc 'owc-dev-server -p 8888'
end
