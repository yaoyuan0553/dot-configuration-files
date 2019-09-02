#!/usr/bin/env bash

sudo apt update
sudo apt-get update

#install zsh and oh-my-zsh
sudo apt-get install -y git vim zsh openssh-server curl
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


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
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev

# install clang-format
sudo apt-get install -y clang-format

# install YCM
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
# ~/.vim/bundle/YouCompleteMe/install.py

