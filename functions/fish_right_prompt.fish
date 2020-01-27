function fish_right_prompt --description 'Write out the right prompt'
    set -l last_status $status
    if [ $status -ne 0 ]
        echo -ns -- (set_color red)"<$last_status>"(set_color normal)
    end
end
