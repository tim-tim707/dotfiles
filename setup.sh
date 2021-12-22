dotfiles=".config .confs .oh-my-zsh .vim i3 .Xdefaults .bashrc .clang-format .gdbinit .gitconfig .gitignore .vimrc .zshrc"

for file in $dotfiles
do
	ln -s $HOME/dotfiles/$file $HOME
done
