function setup_fish_colors
    # ANSI 16 colours
    #----------------
    # color00 base00 Black                ^solarized_base03
    # color01 base08 Red                  solarized_red
    # color02 base0B Green                solarized_green
    # color03 base0A Yellow               solarized_yellow
    # color04 base0D Blue                 solarized_blue
    # color05 base0E Magenta              solarized_violet
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
    # color16 base09                      solarized_orange
    # color17 base0F                      solarized_magenta
    # color18 base01                      ^solarized_base02
    # color19 base02                      solarized_base01
    # color20 base04                      ^solarized_base0
    # color21 base06                      *solarized_base2

    # ^ Only dark theme
    # * Only light theme

    # Base16 colors
    #--------------
    # Background tones
    set -U color_base00 "black"
    # set -U color_base01 "222E38"
    set -U color_base01 "303C41"
    # Content tones
    # set -U color_base02 "586875"
    set -U color_base02 "37474F"
    set -U color_base03 "brblack"
    # set -U color_base04 "85939E"
    set -U color_base04 "B2CCD6"
    set -U color_base05 "white"
    # Background tones
    # set -U color_base06 "E8E9ED"
    set -U color_base06 "FAFAFA"
    set -U color_base07 "brwhite"
    # Accent colors
    set -U color_base08 "red"
    # set -U color_base09 "E66B2B"
    set -U color_base09 "F78C6C"
    set -U color_base0A "yellow"
    set -U color_base0B "green"
    set -U color_base0C "cyan"
    set -U color_base0D "blue"
    set -U color_base0E "magenta"
    # set -U color_base0F "D73C9A"
    set -U color_base0F "C17E70"
    # Color aliases
    set -U color_background $color_base00
    set -U color_comment    $color_base03
    set -U color_primary    $color_base05
    set -U color_highlight  $color_base07
    set -U color_red        $color_base08
    set -U color_orange     $color_base09
    set -U color_yellow     $color_base0A
    set -U color_green      $color_base0B
    set -U color_cyan       $color_base0C
    set -U color_blue       $color_base0D
    set -U color_magenta    $color_base0E
    set -U color_brown      $color_base0F

    # Debug prints
    #-------------
    set_color $color_base00; echo -n 'base00'; set_color normal; echo
    set_color $color_base01; echo -n 'base01'; set_color normal; echo
    set_color $color_base02; echo -n 'base02'; set_color normal; echo
    set_color $color_base03; echo -n 'base03'; set_color normal; echo
    set_color $color_base04; echo -n 'base04'; set_color normal; echo
    set_color $color_base05; echo -n 'base05'; set_color normal; echo
    set_color $color_base06; echo -n 'base06'; set_color normal; echo
    set_color $color_base07; echo -n 'base07'; set_color normal; echo
    set_color $color_base08; echo -n 'base08'; set_color normal; echo
    set_color $color_base09; echo -n 'base09'; set_color normal; echo
    set_color $color_base0A; echo -n 'base0A'; set_color normal; echo
    set_color $color_base0B; echo -n 'base0B'; set_color normal; echo
    set_color $color_base0C; echo -n 'base0C'; set_color normal; echo
    set_color $color_base0D; echo -n 'base0D'; set_color normal; echo
    set_color $color_base0E; echo -n 'base0E'; set_color normal; echo
    set_color $color_base0F; echo -n 'base0F'; set_color normal; echo

    # Fish colors
    #------------
    set -U fish_color_normal $color_primary # the default color
    set -U fish_color_command $color_blue # the color for commands
    set -U fish_color_quote $color_cyan # the color for quoted blocks of text
    set -U fish_color_redirection $color_brown # the color for IO redirections
    set -U fish_color_end $color_green # the color for process separators like ';' and '&'
    set -U fish_color_error $color_red # the color used to highlight potential errors
    set -U fish_color_param $color_magenta # the color for regular command parameters
    set -U fish_color_comment $color_comment # the color used for code comments
    set -U fish_color_match $color_cyan # the color used to highlight matching parenthesis
    set -U fish_color_selection $color_red '--bold' "--background=$color_comment"
    set -U fish_color_search_match "--background=$color_comment" # the color used to highlight history search matches
    set -U fish_color_operator $color_orange # the color for parameter expansion operators like '*' and '~'
    set -U fish_color_escape $color_yellow # the color used to highlight character escapes like '\n' and '\x70'
    set -U fish_color_cwd $color_blue # the color used for the current working directory in the default prompt
    set -U fish_color_cwd_root $color_red
    set -U fish_color_autosuggestion $color_comment # the color used for autosuggestions
    set -U fish_color_user $color_green # the color used to print the current username in some of fish default prompts
    set -U fish_color_host $color_cyan # the color used to print the current host system in some of fish default prompts
    set -U fish_color_cancel $color_comment # the color for the '^C' indicator on a canceled command
    set -U fish_pager_color_prefix $color_cyan # the color of the prefix string, i.e. the string that is to be completed
    set -U fish_pager_color_completion $color_comment # the color of the completion itself
    set -U fish_pager_color_description $color_primary # the color of the completion description
    set -U fish_pager_color_progress '--underline' "--background=$color_cyan" # the color of the progress bar at the bottom left corner
    set -U fish_pager_color_secondary $color_red # the background color of the every second completion

    # Custom fish colors
    #-------------------
    set -U fish_color_vcs $color_yellow # the color used to print the current vcs/git branch in prompt
end
