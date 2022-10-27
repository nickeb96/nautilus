function make --wraps=make --description 'Look for Makefile up to 5 directories back and run it there.'
    set -l make_command make
    if command -q gmake
        set make_command gmake
    end
    set -l search_depth 5
    if status is-interactive
        # check parent directories for a Makefile and do those
        pushd .
        for i in (seq $search_depth)
            if test -f Makefile
                command $make_command $argv
                set -l exit_status $status
                popd
                return $exit_status
            else
                cd ..
            end
        end
        popd
    end
    command $make_command $argv
end
