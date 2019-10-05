# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description 'Displays the current mode'
    # Do nothing if not in vi mode
    if using_vi_key_bindings
        switch $fish_bind_mode
            case default
                set_color --reverse $color_blue
                echo ' N '
            case insert
                set_color --reverse $color_green
                echo ' I '
            case replace_one
                set_color --reverse $color_red
                echo ' R '
            case visual
                set_color --reverse $color_orange
                echo ' V '
        end
        set_color normal
        echo -n ' '
    end
end
