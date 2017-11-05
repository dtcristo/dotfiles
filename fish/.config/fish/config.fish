# chruby, ruby version switcher
set -gx CHRUBY_ROOT /usr
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Interactive shell
#------------------
if status --is-interactive
    # Base16 shell colors
    eval sh $HOME/.config/base16-shell/scripts/base16-solarflare.sh

    # BUG: Already set as universal variable, should not need to set here
    set -U fish_escape_delay_ms 10
end

# Login shell
#------------
if status --is-login
    # neofetch prints system info on login
    echo
    neofetch
end
