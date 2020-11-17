# special workaround for overwritting standard functions
function prompt_hostname
    _nautilus_prompt_hostname $argv
end

function prompt_pwd
    _nautilus_prompt_pwd $argv
end


set -l uninstall_event (basename (status filename) .fish)_uninstall
function $uninstall_event --inherit-variable uninstall_event --on-event $uninstall_event
    # special workaround for resetting standard functions defined by fish
    functions --erase prompt_hostname
    functions --erase prompt_pwd
    source $__fish_data_dir/functions/prompt_hostname.fish
    source $__fish_data_dir/functions/prompt_pwd.fish
end
