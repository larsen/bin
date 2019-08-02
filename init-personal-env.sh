. ~/bin/bash-aliases.sh
. ~/bin/work-aliases.sh
. ~/bin/cd-history.sh
# . ~/bin/mxm-aliases.sh
. ~/bin/functions.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS2="…> "
# export PS2="\u@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
