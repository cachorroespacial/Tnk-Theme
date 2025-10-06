function fish_prompt
    set -l last_status $status
    set -l normal (set_color normal)
    
    set -l is_root false
    if test $USER = "root"
        set is_root true
    else if test (id -u) -eq 0
        set is_root true
    end
    
    if test $is_root = true
        if not set -q _cachorrotech_root_shown
            set -g _cachorrotech_root_shown true
            echo "                       ______"
            echo "                    .-\"      \"-."
            echo "                   /            \\"
            echo "       _          |              |          _"
            echo "      ( \\         |,  .-.  .-.  ,|         / )"
            echo "       > \"=._     | )(__/  \\__)( |     _.=\" <"
            echo "      (_/\"=._\"=._ |/     /\\     \\| _.=\"_.=\"\\_)"
            echo "             \"=._ (_     ^^     _)\"_.=\""
            echo "                 \"=\\__|IIIIII|__/=\""
            echo "                _.=\"| \\IIIIII/ |\"=._"
            echo "      _     _.=\"_.=\"\\          /\"=._\"=._     _"
            echo "     ( \\_.=\"_.=\"     \\`--------\\`     \"=._\"=._/ )"
            echo "      > _.=\"                            \"=._ <"
            echo "     (_/                                    \\_)"
            echo ""
            echo "─────────────────────────────────────────────────────"
            echo ""
        end
    end
    
    if test $is_root = true
        set color_main (set_color red)
        set color_brackets (set_color brred)
        set symbol_prompt "#"
    else
        set color_main (set_color 5fafd7) 
        set color_brackets (set_color 87afd7)
        set symbol_prompt "\$"
    end
    
    set -l color_path (set_color bryellow)
    set -l color_prompt (set_color white)
    
    set -l symbol_top "╭───"
    set -l symbol_bottom "╰─"
    
    echo -n -s $color_brackets $symbol_top " " $normal
    
    echo -n -s $color_brackets "[ " $normal
    echo -n -s $color_main (whoami) "@" (hostname -s)
    echo -n -s $color_brackets " ]" $normal
    
    set -l current_dir (pwd)
    set -l home_dir ~
    
    if test "$current_dir" != "$home_dir"
        echo -n -s " " $color_brackets "in" $normal " " $color_brackets "[ " $normal
        echo -n -s $color_path (prompt_pwd)
        echo -n -s $color_brackets " ]" $normal
    end
    
    echo
    
    echo -n -s $color_brackets $symbol_bottom $normal
    echo -n -s " " $color_prompt $symbol_prompt " " $normal
end