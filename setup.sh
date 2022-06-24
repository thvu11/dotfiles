#!/bin/bash

echo "Setup profile"
cp profile ~/.profile
source ~/.profile

echo "Setup vimrc"
cp vimrc ~/.vimrc

echo "Setup vim plugin"
mkdir -p ~/.vim/
cp -r vim/ ~/.vim/

echo "Open .vimrc and run :PlugInstall to download all plugins"

echo "Setup done"
