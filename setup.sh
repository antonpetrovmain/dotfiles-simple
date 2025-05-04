#!/bin/bash
rm $HOME/.tmux.conf
rm $HOME/.bashrc
rm $HOME/.gitconfig
rm -rf $HOME/.devpod/config.yaml


ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

mkdir $HOME/.devpod
ln -s $HOME/dotfiles/devpod/config.yaml $HOME/.devpod/config.yaml

echo "Dotfiles installed!"
