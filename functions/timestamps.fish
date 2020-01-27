function timestamps -d 'Display creation, modified, and last access date of files'
    if [ (uname) = 'Darwin' ]
        command stat -f '%N%n%tcreate: %SB%n%tmodify: %Sm%n%taccess: %Sa' -- $argv
    else if [ (uname) = 'Linux' ]
        command stat --printf='%n\n\tcreate: %w\n\tmodify: %x\n\taccess: %y\n' -- $argv
    end
end
