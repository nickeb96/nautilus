function view --wraps=nvim
    if type -q nvim
        command nvim -RM $argv
    else
        command view $argv
    end
end
