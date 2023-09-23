dotfiles=".confs .oh-my-zsh .vim .Xdefaults .bashrc .clang-format .gdbinit .gitconfig .gitignore .vimrc"
# .zshrc

config_dirs="i3 polybar rofi nvim alacritty picom"

for file in $dotfiles
do
	ln -s $HOME/dotfiles/$file $HOME
done

for dir in $config_dirs
do
	ln -s $HOME/dotfiles/$dir $HOME/.config
done
