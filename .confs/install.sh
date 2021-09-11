#!/bin/sh

dot_list="opam config emacs jnewsrc mozilla msmtprc muttrc signature slrnrc ssh
Xdefaults thunderbird
"
custom_dotfiles=".vim .vimrc .gitconfig .gitignore .bashrc"

for f in $dot_list; do
  rm -rf "$HOME/.$f"
  ln -s "$AFS_DIR/.confs/$f" "$HOME/.$f"
done

for f in $custom_dotfiles; do
  rm -rf "$HOME/$f"
  ln -s "$AFS_DIR/dotfiles/$f" "$HOME/$f"
done

if ! [[ -x $"(command -v home-manager)" ]]; then
    nix-channel --add
    https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager
    nix-channel --update
    export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
    nix-shell '<home-manager>' -A install
fi
