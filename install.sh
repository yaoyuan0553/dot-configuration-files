#!/usr/bin/env bash

# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# symbolic link to bash_profile and vimrc
ln -s ~/dot-configuration-files/.vimrc ~/.vimrc
ln -s ~/dot-configuration-files/.bash_profile ~/.bash_profile

# source .bash_profile in .bashrc
echo "Please add bash_profile to basrc or zshrc"

# install Vim Plugins
vim -c "PluginInstall" -c "qa"

# install YCM prerequisites
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev

# install YCM
# ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
~/.vim/bundle/YouCompleteMe/install.py

# install clang-format
sudo apt-get install clang-format

# install zsh
sudo apt install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# change shell to zsh
chsh -s $(which zsh)
