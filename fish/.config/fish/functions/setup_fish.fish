function setup_fish --description 'Sets up universal variables and preferences'
    echo 'Starting setup_fish...'

    # Bootstrap Fisher installation
    #------------------------------
    if not functions -q fisher
        echo '...installing Fisher'
        curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
        fish -c fisher
    end

    # Android dev environment on macOS
    #---------------------------------
    if test (uname) = 'Darwin'
        set -Ux ANDROID_SDK_ROOT $HOME/Library/Android/sdk
        set -Ux ANDROID_HOME $ANDROID_SDK_ROOT
        set -Ux ANDROID_NDK_HOME /usr/local/share/android-ndk
        set -Ux JAVA_HOME (/usr/libexec/java_home -v 1.8)
    end

    # User paths
    #-----------
    echo '...setting user paths'

    set -l git_safe_bin_path .git/safe/../../bin
    if not contains $git_safe_bin_path $PATH && not contains $git_safe_bin_path $fish_user_paths
        set -U fish_user_paths $git_safe_bin_path $fish_user_paths
    end

    set new_user_paths \
        $HOME/.local/bin \
        $HOME/.cargo/bin \
        $HOME/go/bin \
        $HOME/.asdf/shims \
        /usr/local/opt/asdf/shims \
        /usr/local/opt/asdf/bin \
        /opt/asdf-vm/asdf/shims \
        /opt/asdf-vm/asdf/bin \
        /usr/local/opt/postgresql@11/bin \
        $ANDROID_HOME/emulator \
        $ANDROID_HOME/tools \
        $ANDROID_HOME/tools/bin \
        $ANDROID_HOME/platform-tools \
        $JAVA_HOME/bin \
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
    set -Ux VISUAL code
    set -Ux OVERMIND_COLORS 2,1,3,4,5,6,16,17
    # Paths to find C/C++ headers
    set -Ux CPATH $HOME/.local/include /usr/local/include /usr/include
    set -Ux CPPFLAGS "-I$HOME/.local/include -I/usr/local/opt/postgresql@11/include -I/usr/local/include -I/usr/include"
    # Paths to find static libraries
    set -Ux LIBRARY_PATH $HOME/.local/lib /usr/local/lib /usr/lib
    set -Ux LDFLAGS "-L/usr/local/opt/postgresql@11/lib -L/usr/local/lib -L/usr/lib"
    # Paths to find dynamic libraries
    set -Ux LD_LIBRARY_PATH $LIBRARY_PATH
    # Paths in which pkg-config will search for its .pc files
    set -Ux PKG_CONFIG_PATH $HOME/.local/lib/pkgconfig /usr/local/opt/postgresql@11/lib/pkgconfig /usr/local/lib/pkgconfig /usr/lib/pkgconfig

    # Linux environment variables
    if test (uname) != 'Darwin'
        set -Ux XDG_SESSION_TYPE wayland
        set -Ux MOZ_ENABLE_WAYLAND 1
        # set -Ux SDL_VIDEODRIVER wayland
        set -Ux SDL_VIDEODRIVER x11
        set -Ux QT_QPA_PLATFORM wayland-egl
        set -Ux QT_WAYLAND_FORCE_DPI physical
        set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    end

    # fzf colors
    if test -f $HOME/.config/base16/output/fzf/fish/base16-material-alt.fish
        source $HOME/.config/base16/output/fzf/fish/base16-material-alt.fish
    end

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
    # Shorten escape delay to minimum
    set -U fish_escape_delay_ms 10
    # Hybrid vi mode, retains emacs bindings
    set -U fish_key_bindings fish_hybrid_key_bindings

    # Abbreviations
    #--------------
    echo '...setting abbreviations'
    abbr -a n 'nvim'
    abbr -a vi 'nvim'
    abbr -a vim 'nvim'
    abbr -a r 'rspec'
    abbr -a wr 'watchexec --exts rb -- bin/rspec'
    abbr -a be 'bundle exec'
    abbr -a os 'overmind start'
    abbr -a oc 'overmind connect'
    abbr -a tf 'terraform'
    abbr -a kc 'kubectl'
    abbr -a serve 'ruby -run -ehttpd . -p 8888'
    abbr -a owc 'owc-dev-server -p 8888'
    abbr -a speakers 'pacmd set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo'
end
