function setup_fish --description 'Sets up universal variables and preferences'
    echo 'Starting fish_setup...'

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
        # .git/safe/../../bin \
        $HOME/bin \
        $HOME/go/bin \
        $HOME/.yarn/bin \
        $HOME/.cargo/bin
    for x in $new_user_paths
        # if not contains $x $fish_user_paths
        if begin not contains $x $fish_user_paths; and test -d $x; end
            set -U fish_user_paths $fish_user_paths $x
        end
    end

    # Environment variables
    #----------------------
    echo '...setting environment variables'
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    # Path for C/C++ headers
    # set -Ux CPATH /home/dtcristo/dev/crystal/cray/raylib/src /usr/local/include /usr/include
    set -Ux CPATH /usr/local/include /usr/include
    # Path to find static libraries
    #set -Ux LIBRARY_PATH /home/dtcristo/lib /usr/local/lib /usr/lib
    # Path to find dynamic libraries
    #set -Ux LD_LIBRARY_PATH $LIBRARY_PATH
    set -Ux PKG_CONFIG_PATH /usr/local/opt/openssl/lib/pkgconfig /usr/lib/pkgconfig

    # Clear fish greeting
    #--------------------
    echo '...clearing greeting'
    set fish_greeting

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
    abbr -a serve 'ruby -run -ehttpd .'
end
