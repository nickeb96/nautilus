function fish_greeting
    if test -f ~/.todo; and test -s ~/.todo
        echo '#### To Do List ####'
        cat ~/.todo
        echo
    end
    if type -q when
        when
    end
end
