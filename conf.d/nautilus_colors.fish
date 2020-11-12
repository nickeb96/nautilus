# Old Color Pallet:
#
#   black       '0x000000'
#   red         '0xd54e53'
#   green       '0xb9ca4a'
#   yellow      '0xe6c547'
#   blue        '0x7aa6da'
#   magenta     '0xc397d8'
#   cyan        '0x70c0ba'
#   white       '0xeaeaea'
#   brblack     '0x666666'
#   brred       '0xff3334'
#   brgreen     '0x9ec400'
#   bryellow    '0xe7c547'
#   brblue      '0x7aa6da'
#   brmagenta   '0xb77ee0'
#   brcyan      '0x54ced6'
#   brwhite     '0xffffff'


set -l black        000000
set -l red          d81e00
set -l green        5ea702
set -l yellow       cfae00
set -l blue         427ab3
set -l magenta      89658e
set -l cyan         00a7aa
set -l white        dbded8
set -l brblack      666666
set -l brred        ff3334
set -l brgreen      9ec400
set -l bryellow     e7c547
set -l brblue       7aa6da
set -l brmagenta    b77ee0
set -l brcyan       54ced6
set -l brwhite      ffffff


set -g fish_color_autosuggestion 555555
set -g fish_color_cancel --reverse
set -g fish_color_command $green
set -g fish_color_comment $brblack
set -g fish_color_cwd --bold $blue
set -g fish_color_cwd_root --bold $red
set -g fish_color_end $brcyan
set -g fish_color_error $brred
set -g fish_color_escape --bold $bryellow
set -g fish_color_history_current --bold
set -g fish_color_host $brgreen
set -g fish_color_host_remote $bryellow
set -g fish_color_match --background=$blue
set -g fish_color_normal normal
set -g fish_color_operator $brmagenta
set -g fish_color_param normal
set -g fish_color_quote $yellow
set -g fish_color_redirection $brcyan
set -g fish_color_search_match $bryellow --background=$brblack
set -g fish_color_selection $white --bold --background=$brblack
set -g fish_color_status $red
set -g fish_color_user $brblue
set -g fish_color_valid_path --underline


set -l uninstall_event (basename (status -f) .fish)_uninstall
function $uninstall_event --on-event $uninstall_event
    set -l color_variables fish_color_autosuggestion fish_color_cancel \
        fish_color_command fish_color_commentfish_color_cwd \
        fish_color_cwd_root fish_color_end fish_color_error fish_color_escape \
        fish_color_history_current fish_color_host fish_color_host_remote \
        fish_color_match fish_color_normal fish_color_operator \
        fish_color_param fish_color_quote fish_color_redirection \
        fish_color_search_match fish_color_selection fish_color_status \
        fish_color_user fish_color_valid_path
    for var in $color_variables
        set -eg $var
    end
end
