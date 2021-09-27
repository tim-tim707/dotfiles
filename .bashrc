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

alias la='ls -a --color=auto'
alias l='l -la --color=auto'
alias mkdir='mkdir -p'

function mkcd() {
    mkdir $1 && cd $1
}

function cd() {
    builtin cd $1 && ls
}

PS1="\[\e[1;32m\] \w ~> \[\e[m\]"

LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

bind '"\eOd": backward-word'
bind '"\eOc": forward-word'

set colored-stats On
set completion-ignore-case On
set mark-symlinked-directories On
set show-all-if-ambiguous On
set show-all-if-unmodified On
