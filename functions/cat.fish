function cat --wraps=cat --description 'Fold markdown files instead of cat when interactive.'
    if status is-interactive
        # if all input files are markdown, use fold instead
        set -l markdown 0
        for arg in $argv
            if string match -q -- "*.md" $arg
                set markdown 1
            else
                set markdown 0
                break
            end
        end
        set -l width $COLUMNS
        if [ $markdown -eq 1 ]
            command fold -s -w $width $argv
        else
            command cat $argv
        end
    else
        command cat $argv
    end
end
