# asdf, version switcher - manually at paths in `setup_fish.fish`
# if test -f /usr/local/opt/asdf/asdf.fish
#     source /usr/local/opt/asdf/asdf.fish
# end
if test -f /usr/local/opt/asdf/lib/asdf.fish
    # Load the asdf wrapper function
    source /usr/local/opt/asdf/lib/asdf.fish
end
# if test -f /opt/asdf-vm/asdf.fish
#     source /opt/asdf-vm/asdf.fish
# end
if test -f /opt/asdf-vm/lib/asdf.fish
    # Load the asdf wrapper function
    source /opt/asdf-vm/lib/asdf.fish
end

# Interactive shell
#------------------
if status --is-interactive
    # Source .dir_colors on macOS and use coreutils `ls`
    if test (uname) = 'Darwin'
        # Base16 shell colors on macOS
        if test -f $HOME/.config/base16/output/shell/scripts/base16-material-alt.sh
            sh $HOME/.config/base16/output/shell/scripts/base16-material-alt.sh
        end

        # Source .dir_colors on macOS and use coreutils `ls`
        eval (gdircolors --c-shell $HOME/dotfiles/shell/.dir_colors)
        alias ls='gls --color'
    end

    # Interactive login shell
    #------------------------
    if status --is-login
        # Start sway if on tty1
        if test (uname) != 'Darwin' && test -z "$DISPLAY" && test (tty) = '/dev/tty1'
            exec sway
        end
    end
end
