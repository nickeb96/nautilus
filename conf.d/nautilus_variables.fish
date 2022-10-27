set -q pisces_only_insert_at_eol
or set -g pisces_only_insert_at_eol 1

set -q fish_prompt_pwd_dir_length
or set -g fish_prompt_pwd_dir_length 4

set -q fish_prompt_pwd_use_ellipsis
or set -g fish_prompt_pwd_use_ellipsis yes

set -q rsync_options
or set -g rsync_options --times --crtimes --open-noatime --perms --owner --group --links --recursive

set -l uninstall_event (basename (status filename) .fish)_uninstall
function _$uninstall_event --on-event $uninstall_event
    # no op for now
end
