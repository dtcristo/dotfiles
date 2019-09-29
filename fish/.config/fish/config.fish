# chruby, ruby version switcher
# set -gx CHRUBY_ROOT /usr
# if test -f /usr/local/share/chruby/chruby.fish
#   source /usr/local/share/chruby/chruby.fish
# end
# if test -f /usr/local/share/chruby/auto.fish
#   source /usr/local/share/chruby/auto.fish
# end

# asdf, version switcher
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end

# Interactive shell
#------------------
if status --is-interactive
    # Base16 shell colors
    if test -f $HOME/.config/base16/base16-material-alt.sh
        eval sh $HOME/.config/base16/base16-material-alt.sh
    end

    # Source .dir_colors on macOS and use coreutils `ls`
    if test (uname) = "Darwin"
        eval (gdircolors --c-shell $HOME/dotfiles/shell/.dir_colors)
        alias ls='gls --color'
    end

    # Interactive login shell
    #------------------------
    if status --is-login
        # Clear screen and print system info on login (non macOS)
        if test (uname) != "Darwin"
            clear; echo; neofetch
        end
    end
end
