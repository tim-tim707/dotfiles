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
