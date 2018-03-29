# Quick cd to recently visited directories

source /usr/share/autojump/autojump.sh

function c() {
    DIR=$(cat ~/.local/share/autojump/autojump.txt | cut -f 2 | d)
    if [[ $DIR != "" ]]; then
        cd $DIR
    fi
}
