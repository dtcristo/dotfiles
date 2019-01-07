# Function sets up universal variables and preferenced
function setup_fish
    echo 'Starting fish_setup...'
    # User paths
    #-----------
    # echo '...setting user paths'
    set -U fish_user_paths /home/dtcristo/bin/crystal-0.27.0-1/bin
    # set -gx PATH /home/dtcristo/bin /home/dtcristo/.yarn/bin $PATH

    # Environment variables
    #----------------------
    echo '...setting environment variables'
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    # Path for C/C++ headers
    # set -Ux CPATH /home/dtcristo/dev/crystal/cray/raylib/src:/usr/local/include:/usr/include
    set -Ux CPATH /usr/local/include:/usr/include
    # Path to find static libraries
    set -Ux LIBRARY_PATH /home/dtcristo/dev/crystal/crsfml/voidcsfml:/home/dtcristo/lib:/usr/local/lib:/usr/lib
    # Path to find dynamic libraries
    set -Ux LD_LIBRARY_PATH $LIBRARY_PATH

    # Fix rmagick install
    set -Ux PKG_CONFIG_PATH /usr/lib/imagemagick6/pkgconfig:/usr/lib/pkgconfig

    # Clear fish greeting
    #--------------
    set fish_greeting

    # Fish colors
    #------------
    echo '...setting fish colors'
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
    abbr -a dig 'drill'
    abbr -a serve 'ruby -run -ehttpd .'
end
