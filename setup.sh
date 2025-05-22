#!/bin/bash
rm $HOME/.tmux.conf
rm $HOME/.bashrc
rm -rf $HOME/.config/nvim

ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc

# Neovim
mkdir $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim

mkdir $HOME/.local/bin/
sudo ln -s $HOME/dotfiles/lsp/jdtls $HOME/.local/bin/jdtls
sudo ln -s $HOME/dotfiles/lsp/lua-language-server $HOME/.local/bin/lua-language-server

echo "Dotfiles installed!"
