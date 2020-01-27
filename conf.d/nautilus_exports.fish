set -gx EDITOR nvim
set -gx PAGER less
set -gx LESSHISTFILE /dev/null
set -gx LS_COLORS 'di=34:ln=36:so=31:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
set -gx LSCOLORS 'exgxbxdxcxegedabagacad'
set -gx CPATH ~/.local/include
set -gx CPLUS_INCLUDE_PATH ~/.local/include/c++
set -gx DYLD_LIBRARY_PATH ~/.local/lib
set -gx LD_LIBRARY_PATH ~/.local/lib
set -gx LIBRARY_PATH ~/.local/lib
set -gx PYTHONPATH ~/.local/lib/python3
set -gx PYTHONSTARTUP ~/.config/python/startup.py


set -l uninstall_event (basename (status -f) .fish){_uninstall}
function $uninstall_event --on-event $uninstall_event
    set -eg EDITOR
    set -eg PAGER
    set -eg LESSHISTFILE
    set -eg LS_COLORS
    set -eg LSCOLORS
    set -eg CPATH
    set -eg CPLUS_INCLUDE_PATH
    set -eg DYLD_LIBRARY_PATH
    set -eg LD_LIBRARY_PATH
    set -eg LIBRARY_PATH
    set -eg PYTHONPATH
    set -eg PYTHONSTARTUP
ened
