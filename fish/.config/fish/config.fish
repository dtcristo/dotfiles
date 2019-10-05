# asdf, version switcher
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end
if test -f /opt/asdf-vm/asdf.fish
    source /opt/asdf-vm/asdf.fish
end

# Interactive shell
#------------------
if status --is-interactive
    # Base16 shell colors
    if test -f $HOME/.config/base16/base16-material-alt.sh
        eval sh $HOME/.config/base16/base16-material-alt.sh
    end

    # Start sway if on tty1
    if test -z "$DISPLAY" and test (tty) = '/dev/tty1'
        exec sway
    end

    # Source .dir_colors on macOS and use coreutils `ls`
    if test (uname) = 'Darwin'
        eval (gdircolors --c-shell $HOME/dotfiles/shell/.dir_colors)
        alias ls='gls --color'
    end

    # Interactive login shell
    #------------------------
    if status --is-login
        # Clear screen and print system info on login (non macOS)
        if test (uname) != 'Darwin'
            clear; echo; neofetch
        end
    end
end
