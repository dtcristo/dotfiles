set -gx EDITOR nvim
set -gx VISUAL nvim

# chruby, ruby version switcher
#------------------------------
set -gx CHRUBY_ROOT /usr
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

# Base16 Shell
#-------------
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-solar-flare.sh
  source $HOME/.config/base16-shell/profile_helper.fish
end

abbr be 'bundle exec'
abbr dig 'drill'
abbr to_staging 'git checkout staging; and git merge development; and git push; and git checkout development'
abbr to_master 'git checkout master; and git merge staging; and git push; and git checkout development'
