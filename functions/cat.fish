function cat --wraps=cat --description 'Fold markdown files instead of cat when interactive.'
    if status is-interactive
        # if all input files are markdown, use fold instead
        set -l markdown false
        for arg in $argv
            if string match -q -- "*.md" $arg
                set markdown true
            else
                set markdown false
                break
            end
        end
        if $markdown
            command fold -s $argv
        else
            command cat $argv
        end
    else
        command cat $argv
    end
end
