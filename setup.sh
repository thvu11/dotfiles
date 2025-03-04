#!/bin/bash

echo "Setup profile"
cp profile $HOME/.profile
source $HOME/.profile

echo "Setup vimrc"
cp vimrc $HOME/.vimrc

echo "Setup nvim config"
mkdir -p $HOME/.config/nvim/
cp init.vim $HOME/.config/nvim/

echo "Setup vim plugin"
mkdir -p $HOME/.vim/
cp -r vim/ $HOME/.vim/
echo "Download vim plug"
mkdir -p $HOME/.vim/autoload/
curl -Ls https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $HOME/.vim/autoload/plug.vim

echo "Open .vimrc and run :PlugInstall to download all plugins"

echo "Setup done"
