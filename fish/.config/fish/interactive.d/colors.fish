# Base16 color mapping
#=====================
#
# ANSI 16 colours
#----------------
# color00 base00 Black                ^solarized_base03
# color01 base08 Red                  solarized_red
# color02 base0B Green                solarized_green
# color03 base0A Yellow               solarized_yellow
# color04 base0D Blue                 solarized_blue
# color05 base0E Magenta              solarized_violet        (Violet)
# color06 base0C Cyan                 solarized_cyan
# color07 base05 White                solarized_base1
# color08 base03 Bright_Black         *solarized_base00
# color09 base08 Bright_Red
# color10 base0B Bright_Green
# color11 base0A Bright_Yellow
# color12 base0D Bright_Blue
# color13 base0E Bright_Magenta
# color14 base0C Bright_Cyan
# color15 base07 Bright_White         *solarized_base3
#
# 256 colors
#-----------
# color16 base09                      solarized_orange        (Orange)
# color17 base0F                      solarized_magenta       (Magenta)
# color18 base01                      ^solarized_base02
# color19 base02                      solarized_base01
# color20 base04                      ^solarized_base0
# color21 base06                      *solarized_base2

# ^ Only dark theme
# * Only light theme

# Base16 colors
#--------------
# Background tones
set -l base00 "black"
set -l base01 "222E38"
# Content tones
set -l base02 "586875"
set -l base03 "brblack"
set -l base04 "85939E"
set -l base05 "white"
# Background tones
set -l base06 "E8E9ED"
set -l base07 "brwhite"
# Accent colors
set -l base08 "red"
set -l base09 "E66B2B"   # Orange
set -l base0A "yellow"
set -l base0B "green"
set -l base0C "cyan"
set -l base0D "blue"
set -l base0E "magenta"  # Violet
set -l base0F "D73C9A"   # Magenta
# Accent colors (aliases)
set -l background $base00
set -l comment    $base03
set -l primary    $base05
set -l highlight  $base07
set -l red     $base08
set -l orange  $base09
set -l yellow  $base0A
set -l green   $base0B
set -l cyan    $base0C
set -l blue    $base0D
set -l violet  $base0E
set -l magenta $base0F

# Debug prints
#-------------
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

# Fish colors
#------------
set -g fish_color_normal $primary # the default color
set -g fish_color_command $blue # the color for commands
set -g fish_color_quote $cyan # the color for quoted blocks of text
set -g fish_color_selection $red '--bold' '--background=brblack'
set -g fish_color_redirection $red # the color for IO redirections
set -g fish_color_end $green # the color for process separators like ';' and '&'
set -g fish_color_error $red # the color used to highlight potential errors
set -g fish_color_param $violet # the color for regular command parameters
set -g fish_color_comment $comment # the color used for code comments
set -g fish_color_match $cyan # the color used to highlight matching parenthesis
set -g fish_color_search_match "--background=$comment" # the color used to highlight history search matches
set -g fish_color_operator $orange # the color for parameter expansion operators like '*' and '~'
set -g fish_color_escape $yellow # the color used to highlight character escapes like '\n' and '\x70'
set -g fish_color_cwd $green # the color used for the current working directory in the default prompt
set -g fish_color_cwd_root $red
set -g fish_color_autosuggestion $comment # the color used for autosuggestions
set -g fish_color_user $blue # the color used to print the current username in some of fish default prompts
set -g fish_color_host $cyan # the color used to print the current host system in some of fish default prompts
set -g fish_color_cancel $comment # the color for the '^C' indicator on a canceled command
set -g fish_pager_color_prefix $cyan # the color of the prefix string, i.e. the string that is to be completed
set -g fish_pager_color_completion $comment # the color of the completion itself
set -g fish_pager_color_description $primary # the color of the completion description
set -g fish_pager_color_progress "--underline" "--background=$cyan" # the color of the progress bar at the bottom left corner
set -g fish_pager_color_secondary $red # the background color of the every second completion

# Custom fish colors
#-------------------
set -g fish_color_vcs $yellow # the color used to print the current vcs/git branch in prompt
