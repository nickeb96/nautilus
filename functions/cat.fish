function cat --wraps=cat
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
end
