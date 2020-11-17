set -q pisces_only_insert_at_eol
or set -g pisces_only_insert_at_eol 1


set -l uninstall_event (basename (status filename) .fish)_uninstall
function $uninstall_event --on-event $uninstall_event
    # no op for now
end
