function fish_prompt
    set -l last_status $status
    set -l color_cwd
    set -l suffix
    set -l job_text
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end
    begin
        set -l job_count (count (jobs))
        if [ $job_count -gt 0 ]
            set job_text "[$job_count]"
        end
    end
    if type -q git && [ (git rev-parse --is-inside-work-tree 2>/dev/null; or echo) = true ]
        set -l git_root (git rev-parse --show-toplevel)
        #set -l git_root (realpath (git rev-parse --git-dir)/..)
        set -l git_name (basename $git_root)
        set -l git_wd (string sub --start (string length $git_root/) $PWD)
        # This only works on git versions >=2.21
        #set -l git_branch (git branch --show-current)
        set -l git_branch (git branch | grep '*' | sed -E 's/\* ([[:alpha:]]+)/\1/')
        set -l git_hash (git rev-parse --short HEAD 2>/dev/null)
        set -l git_status (string sub -s 2 -l 1 -- (git status -s 2>/dev/null))
        set -l git_info
        if count $git_status >/dev/null
            for char in $git_status
                if [ $char != ' ' ]
                    set git_info '('(set_color yellow)dirty(set_color normal)') '
                    break
                end
            end
            if not string length -q $git_info
                set git_info '('(set_color green)staged(set_color normal)') '
            end
        else
            if string length -q (git remote)
                set -l git_remote (git config --local --get "branch.$git_branch.remote"; or echo origin)
                if string length -q (git log "$git_remote/$git_branch..$git_branch" 2>/dev/null)
                    set git_info '('(set_color brmagenta)ahead(set_color normal)') '
                end
            end
        end
        echo -ns -- $job_text (set_color --bold cyan) $git_name \
            (set_color $color_cwd) $git_wd (set_color normal) ' ' \
            $git_info (set_color $fish_color_host) $git_branch \
            (set_color normal) "$suffix "
    else
        echo -ns -- $job_text (set_color $fish_color_user) $USER \
            (set_color normal) @ (set_color $fish_color_host) \
            (hostname -s) (set_color normal) ' ' (set_color $color_cwd) \
            (prompt_pwd) (set_color normal) "$suffix "
    end
end
