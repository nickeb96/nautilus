function mkdatefile -d 'Interactively creates a file with the current date'
    set -l template (date '+%Y-%m-%d')
    set -l filename ''
    read -P 'filename> ' -c "$template"'.txt' -a filename
    if test -n "$filename"
        touch "$filename"
        return 0
    else
        return 1
    end
end
