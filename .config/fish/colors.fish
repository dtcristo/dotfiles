# 0  Black            base01
# 1  Red              base08
# 2  Yellow           base0A
# 3  Green            base0B
# 4  Blue             base0D
# 5  Magenta          base0F
# 6  Cyan             base0C
# 7  White            base06
# 8  Bright Black     base00
# 9  Bright Red       base09
# 10 Bright Yellow    base03
# 11 Bright Green     base02
# 12 Bright Blue      base04
# 13 Bright Magenta   base0E
# 14 Bright Cyan      base05
# 15 Bright White     base07

# Background tones
set -l base00 "brblack"
set -l base01 "black"
# Content tones
set -l base02 "brgreen"
set -l base03 "bryellow"
set -l base04 "brblue"
set -l base05 "brcyan"
# Background tones
set -l base06 "white"
set -l base07 "brwhite"
# Accent colors
set -l base08 "red"
set -l base09 "brred"
set -l base0A "yellow"
set -l base0B "green"
set -l base0C "cyan"
set -l base0D "blue"
set -l base0E "brmagenta"
set -l base0F "magenta"
# Accent colors (aliased)
set -l red "red"
set -l orange "brred"
set -l yellow "yellow"
set -l green "green"
set -l cyan "cyan"
set -l blue "blue"
set -l violet "brmagenta"
set -l magenta "magenta"

# set_color $base00; echo "base00"
# set_color $base01; echo "base01"
# set_color $base02; echo "base02"
# set_color $base03; echo "base03"
# set_color $base04; echo "base04"
# set_color $base05; echo "base05"
# set_color $base06; echo "base06"
# set_color $base07; echo "base07"
# set_color $base08; echo "base08"
# set_color $base09; echo "base09"
# set_color $base0A; echo "base0A"
# set_color $base0B; echo "base0B"
# set_color $base0C; echo "base0C"
# set_color $base0D; echo "base0D"
# set_color $base0E; echo "base0E"
# set_color $base0F; echo "base0F"
# set_color normal

set -gx fish_color_normal $base04 # the default color
set -gx fish_color_command $blue # the color for commands
set -gx fish_color_quote $cyan # the color for quoted blocks of text
set -gx fish_color_redirection $base04 # the color for IO redirections
set -gx fish_color_end $base04 # the color for process separators like ';' and '&'
set -gx fish_color_error $red # the color used to highlight potential errors
set -gx fish_color_param $violet # the color for regular command parameters
set -gx fish_color_comment $base02 # the color used for code comments
set -gx fish_color_match $cyan # the color used to highlight matching parenthesis
set -gx fish_color_search_match "--background=$base01" # the color used to highlight history search matches
set -gx fish_color_operator $orange # the color for parameter expansion operators like '*' and '~'
set -gx fish_color_escape $yellow # the color used to highlight character escapes like '\n' and '\x70'
set -gx fish_color_cwd $green # the color used for the current working directory in the default prompt
set -gx fish_color_cwd_root $red
set -gx fish_color_autosuggestion $base02 # the color used for autosuggestions
set -gx fish_color_user $blue # the color used to print the current username in some of fish default prompts
set -gx fish_color_host $cyan # the color used to print the current host system in some of fish default prompts
set -gx fish_color_cancel $base02 # the color for the '^C' indicator on a canceled command

set -gx fish_pager_color_prefix $cyan # the color of the prefix string, i.e. the string that is to be completed
set -gx fish_pager_color_completion $base02 # the color of the completion itself
set -gx fish_pager_color_description $yellow # the color of the completion description
set -gx fish_pager_color_progress "--background=$base01" $cyan # the color of the progress bar at the bottom left corner
set -gx fish_pager_color_secondary $base01 # the background color of the every second completion

# Custom fish colors
set -gx fish_color_vcs $yellow # the color used to print the current vcs/git branch in prompt