function using_vi_key_bindings
    test "$fish_key_bindings" = 'fish_vi_key_bindings'
        or test "$fish_key_bindings" = 'fish_hybrid_key_bindings'
end
