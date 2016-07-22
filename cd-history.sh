# Quick cd to recently visited directories

source /usr/share/autojump/autojump.sh

function c() {
    cd $(cat ~/.local/share/autojump/autojump.txt | cut -f 2 | d)
}
