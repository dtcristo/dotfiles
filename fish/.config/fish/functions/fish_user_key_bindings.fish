function fish_user_key_bindings
    # Clear the current line with Ctrl-c
    bind -M default -m insert \cc kill-whole-line force-repaint
    bind -M insert \cc kill-whole-line force-repaint
end
