#!/bin/bash
rm $HOME/.env
rm $HOME/.tmux.conf
rm $HOME/.bashrc
rm $HOME/.gitconfig
rm -rf $HOME/.devpod/config.yaml
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/nixpkgs


ln -s $HOME/dotfiles/.env $HOME/.env
ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

mkdir $HOME/.config
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim

mkdir $HOME/.devpod
ln -s $HOME/dotfiles/devpod/config.yaml $HOME/.devpod/config.yaml

mkdir $HOME/.config/nixpkgs
ln -s $HOME/dotfiles/nix/config.nix $HOME/.config/nixpkgs/config.nix

nix-env -iA nixpkgs.myPackages

mkdir $HOME/.local/bin/
sudo ln -s $HOME/dotfiles/jdtls/jdtls $HOME/.local/bin/jdtls
export JAVA_HOME=/nix/store/`ls -l /nix/store | grep ^d.*openjdk-23 | awk '{print $9}'`

mkdir -p $HOME/tools/llm-cli
cd $HOME/tools/llm-cli
git clone git@github.com:antonpetrovmain/llm-cli.git
source .venv/bin/activate
pip install -r requirements.txt
deactivate
cd -

echo "Dotfiles installed!"
