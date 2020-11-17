set -l abbreviations \
    cp 'cp -i' \
    mv 'mv -i' \
    less 'less -RXS' \
    now 'date "+%I:%M %p"' \
    today 'date "+%A - %m/%d/%y"' \
    tree 'tree -C' \
    c++ 'c++ -std=c++1z -Wall' \
    clang-format 'clang-format -style=file' \


for i in (seq 1 2 (count $abbreviations))
    abbr -ag $abbreviations[$i] $abbreviations[(math "$i + 1")]
end


set -l uninstall_event (basename (status filename) .fish)_uninstall
function $uninstall_event --on-event $uninstall_event --inherit-variable abbreviations
    for i in (seq 1 2 (count $abbreviations))
        abbr -eg $abbreviations[$i]
    end
end
