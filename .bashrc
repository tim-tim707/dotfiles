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

alias la='ls -a --color=auto'
alias l='l -la --color=auto'
alias mkdir='mkdir -p'

function mkcd() {
    mkdir $1 && cd $1
}

PS1="\e[1;32m \w ~>\e[m "
