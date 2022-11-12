function pss -d 'List processes on the machine'
    if [ (uname) = 'Darwin' ]
        command ps -Aco 'user,pid,%cpu,%mem,state,comm'
    else if [ (uname) = 'Linux' ]
        command ps -Ao 'user,pid,%cpu,%mem,state,comm'
    end
end
