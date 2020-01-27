function cat --wraps=cat
    set -l markdown 1
    for arg in $argv
        if string match -q -- "*.md" $arg
            set markdown 0
        else
            set markdown 1
            break
        end
    end
    if test $markdown = 0
        command fold -s $argv
    else
        command cat $argv
    end
end
