#!/usr/bin/env bash

set -e

sudo apt update

# install zsh and oh-my-zsh
sudo apt-get install -y git vim-gtk zsh ssh openssh-server xclip htop curl fonts-powerline tmux most

# symbolic link to bash_profile, vimrc, and tmux
# ln -sf "$HOME/dot-configuration-files/.vimrc" "$HOME/.vimrc"

ln -sf "$HOME/dot-configuration-files/.bash_profile" "$HOME/.bash_profile"

ln -sf "$HOME/dot-configuration-files/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dot-configuration-files/.tmux.conf.local" "$HOME/.tmux.conf.local"

# source .bash_profile in .bashrc
echo "Please add bash_profile to basrc or zshrc"

# install Vim Plugins
# vim -c "PlugInstall" -c "qa"

# install clang-format
sudo apt install -y clang-format

git clone https://chromium.googlesource.com/chromium/tools/depot_tools "$HOME/depot_tools"

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -L git.io/antigen > "$HOME/antigen.zsh"
ln -sf "$HOME/dot-configuration-files/.zshrc" "$HOME/.zshrc"

