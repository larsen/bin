# alias d='dmenu -fn "Droid Sans Mono-16" -l 10 -i'

. ~/bin/work-aliases.sh

alias mc='. /usr/lib/mc/mc-wrapper.sh'

alias s='rofi -show ssh -terminal urxvt'
alias i='toggle_screen_reverse_colors'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias magit='emacsclient -c -e "(magit-status)"'

alias h='hledger register --monthly --depth 1'
alias hs='hledger register --monthly expe --depth 1'
alias hsal='hledger register --monthly salary --depth 1'
alias hgro='hledger register --monthly groceries --depth 1'
alias hdinner='hledger register --monthly food:dinner --depth 1'

alias jvim='jq . | vim +"set ft=json"'

alias he='heroku'
alias icat="kitty +kitten icat"
