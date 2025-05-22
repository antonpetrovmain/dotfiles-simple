#!/bin/bash

rm $HOME/.env
rm $HOME/.gitconfig

ln -s $HOME/dotfiles/.env $HOME/.env
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

echo "Environment configured."
