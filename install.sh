#!/bin/bash

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# symbolic link to bash_profile and vimrc
ln -s ~/dot-configuration-files/.vimrc ~/.vimrc
ln -s ~/dot-configuration-files/.bash_profile ~/.bash_profile

# source .bash_profile in .bashrc
echo "Please add bash_profile to basrc or zshrc"

# install Vim Plugins
vim -c "PluginInstall" -c "q"

# install YCM prerequisites
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

# install YCM
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

# install clang-format
sudo apt-get install clang-format

sudo apt-get install ffmpeg
