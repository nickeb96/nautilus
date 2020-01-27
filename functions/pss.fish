function pss -d 'Shorthand for listing processes on the machine'
    if [ (uname) = 'Darwin' ]
        command ps -Aco 'user,pid,%cpu,%mem,comm'
    else if [ (uname) = 'Linux' ]
        command ps -Ao 'user,pid,%cpu,%mem,comm'
    end
end
