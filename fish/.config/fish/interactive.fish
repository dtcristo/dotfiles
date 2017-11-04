# Vi mode
set -g fish_key_bindings fish_vi_key_bindings

# User key bindings
function fish_user_key_bindings
  bind -M default \cc kill-whole-line force-repaint
  bind -M insert \cc kill-whole-line force-repaint
  bind -M default \cf forward-char
  bind -M insert \cf forward-char
end

set -g fish_cursor_defaut block
set -g fish_cursor_insert line
set -g fish_cursor_visual block
set -g fish_cursor_replace_one underscore
set -g fish_cursor_unknown block

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
