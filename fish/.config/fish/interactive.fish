# Fish colors
source $HOME/.config/fish/interactive.d/colors.fish

# Base16 shell colors
eval sh $HOME/.config/base16-shell/scripts/base16-solarflare.sh
source $HOME/.config/base16-shell/profile_helper.fish

# Abbreviations
set -g fish_user_abbreviations
abbr -a be 'bundle exec'
abbr -a dig 'drill'
abbr -a to_staging 'git checkout staging; and git merge development; and git push; and git checkout development'
abbr -a to_master 'git checkout master; and git merge staging; and git push; and git checkout development'
