# if not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
    export PATH=~afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
    export PATH=~/.local/bin:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"
export EDITOR=vim
setxkbmap -option caps:escape
xset r rate 250 50

alias la='ls -a --color=auto'
alias l='l -la --color=auto'
alias mkdir='mkdir -p'
alias pi='cd /home/timothee.denizou/afs/timothee.denizou-piscine-2024/'
alias vi=vim

mkcd() {
    mkdir $1 && cd $1
}

cd() {
    builtin cd $1 && ls
}

gitac() {
    if [ "$#" -ne 2 ]; then
        echo "Please provide file to add and commit message"
    else
        git add "$1" && git commit -m "$2"
    fi
}

gitact() {
    if [ "$#" -ne 3 ]; then
        echo "Please provide file to add, commit message and tag"
    else
        git add "$1" && git commit -m "$2" && git tag "$3"
    fi
}

PS1="\[\e[1;32m\] \w ~> \[\e[m\]"

LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

# colored man pages and less
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

bind '"\eOd": backward-word'
bind '"\eOc": forward-word'

set colored-stats On
set completion-ignore-case On
set mark-symlinked-directories On
set show-all-if-ambiguous On
set show-all-if-unmodified On

export CFLAGS="-Wall -Wextra -Werror -pedantic -std=c99 -g -fsanitize=address"
