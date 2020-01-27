set -g fish_color_autosuggestion 555
set -g fish_color_cancel --reverse
set -g fish_color_command green
set -g fish_color_comment brblack
set -g fish_color_cwd --bold blue
set -g fish_color_cwd_root --bold red
set -g fish_color_end brcyan
set -g fish_color_error brred
set -g fish_color_escape --bold bryellow
set -g fish_color_history_current --bold
set -g fish_color_host brgreen
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator brmagenta
set -g fish_color_param normal
set -g fish_color_quote yellow
set -g fish_color_redirection brcyan
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_status red
set -g fish_color_user brblue
set -g fish_color_valid_path --underline


set -l uninstall_event (basename (status -f) .fish){_uninstall}
function $uninstall_event --on-event $uninstall_event
    set -l color_variables fish_color_autosuggestion fish_color_cancel \
        fish_color_command fish_color_commentfish_color_cwd \
        fish_color_cwd_root fish_color_end fish_color_error fish_color_escape \
        fish_color_history_current fish_color_host fish_color_match \
        fish_color_normal fish_color_operator fish_color_param \
        fish_color_quote fish_color_redirection fish_color_search_match \
        fish_color_selection fish_color_status fish_color_user \
        fish_color_valid_path
    for var in $color_variables
        set -eg $var
    end
end
