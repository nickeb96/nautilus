function vigpg -a file -d 'View and modify encrypted *.gpg files with vi'
    if not string length -q "$file"
        echo 'Must specify a *.gpg file to edit.'
        return 1
    end

    if [ (count $argv) -gt 1 ]
        echo 'Only accepts one file at a time.'
        return 1
    end

    if not string match -q '*.gpg' "$file"
        echo you fucked up
        return 1
    end

    set len (string length "$file")
    set pid %self

    set filebase (string sub --start 1 --length (math "$len - 4") "$file")
    set temp "vigpg-$pid-$filebase"

    touch "$temp"
    chmod u=rw,go= "$temp"

    if test -f "$file"
        gpg --yes -o "$temp" -d "$file"
    end

    set start (stat -f '%Dm%n' "$temp")

    vi -c 'set noswapfile' -c 'set viminfo=' -- "$temp"

    set stop (stat -f '%Dm%n' "$temp")

    if [ "$stop" -gt "$start" ]
        gpg --yes -o "$file" -r 'Nicholas Boyle' -e "$temp"
    end

    rm "$temp"
end
