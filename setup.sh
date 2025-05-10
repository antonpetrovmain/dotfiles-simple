#!/bin/bash
rm $HOME/.env
rm $HOME/.tmux.conf
rm $HOME/.bashrc
rm $HOME/.gitconfig
rm -rf $HOME/.devpod/config.yaml
rm -rf $HOME/.config/nvim


ln -s $HOME/dotfiles/.env $HOME/.env
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

mkdir $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim

mkdir $HOME/.devpod
ln -s $HOME/dotfiles/devpod/config.yaml $HOME/.devpod/config.yaml

nix-env -iA nixpkgs.myPackages

echo "Dotfiles installed!"
