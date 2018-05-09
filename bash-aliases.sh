# alias d='dmenu -fn "Droid Sans Mono-16" -l 10 -i'
alias i='toggle_screen_reverse_colors'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias magit='emacsclient -c -e "(magit-status)"'
alias dired='emacsclient -c -e "(my-dired-frame default-directory)"'

alias h='hledger register --monthly --depth 1'
alias hs='hledger register --monthly expe --depth 1'
alias hsal='hledger register --monthly salary --depth 1'

alias jvim='jq . | vim +"set ft=json"'
