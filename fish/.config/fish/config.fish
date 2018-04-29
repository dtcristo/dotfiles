# chruby, ruby version switcher
set -gx CHRUBY_ROOT /usr
if test -f /usr/local/share/chruby/chruby.fish
  source /usr/local/share/chruby/chruby.fish
end
if test -f /usr/local/share/chruby/auto.fish
  source /usr/local/share/chruby/auto.fish
end

# Interactive shell
#------------------
if status --is-interactive
    # Base16 shell colors
    if test -f $HOME/.config/base16-shell/scripts/base16-solarflare.sh
      eval sh $HOME/.config/base16-shell/scripts/base16-solarflare.sh
    end

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
