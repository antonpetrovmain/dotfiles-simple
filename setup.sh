#!/bin/bash
rm $HOME/.tmux.conf
rm $HOME/.bashrc
rm $HOME/.gitconfig

ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
echo "Dotfiles installed!"
