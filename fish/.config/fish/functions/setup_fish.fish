# Function sets up universal variables and preferenced
function setup_fish
    echo 'Starting fish_setup...'
    # Environment variables
    #----------------------
    echo '...setting environment variables'
    # set -Ux PATH /home/dtcristo/bin /home/dtcristo/.yarn/bin $PATH
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    # Path for C/C++ headers
    set -Ux CPATH /home/dtcristo/dev/crystal/cray/raylib/src:/home/dtcristo/dev/c/raygui/src
    # Path to find static libraries
    set -Ux LIBRARY_PATH /home/dtcristo/dev/crystal/crsfml/voidcsfml:/home/dtcristo/dev/crystal/cray
    # Path to find dynamic libraries
    set -Ux LD_LIBRARY_PATH $LIBRARY_PATH

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
    abbr -a be 'bundle exec'
    abbr -a dig 'drill'
    abbr -a to_staging 'git checkout staging; and git merge development; and git push; and git checkout development'
    abbr -a to_master 'git checkout master; and git merge staging; and git push; and git checkout development'
end
