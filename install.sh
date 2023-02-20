#!/usr/bin/env bash

set -e

sudo apt update

# install zsh and oh-my-zsh
sudo apt-get install -y git vim-gtk zsh ssh openssh-server xclip htop curl fonts-powerline tmux most

# use less keybindings for `most`
cp /usr/share/doc/most/lesskeys.rc "$HOME/.mostrc"

# install Vundle
# git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

VIM_PLUG_DIR="$HOME/.vim/autoload/plug.vim"
if [ -f "$VIM_PLUG_DIR" ]; then
    echo "vim-plug already exists in $VIM_PLUG_DIR"
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# depot_tools
git clone https://chromium.googlesource.com/chromium/tools/depot_tools "$HOME/depot_tools"

# symbolic link to bash_profile, vimrc, and tmux
ln -sf "$HOME/dot-configuration-files/.vimrc" "$HOME/.vimrc"

ln -sf "$HOME/dot-configuration-files/.bash_profile" "$HOME/.bash_profile"

ln -sf "$HOME/dot-configuration-files/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$HOME/dot-configuration-files/.tmux.conf.local" "$HOME/.tmux.conf.local"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# source .bash_profile in .bashrc
echo "Please add bash_profile to basrc or zshrc"

# install Vim Plugins
vim -c "PlugInstall" -c "qa"

# install YCM prerequisites
sudo apt install -y build-essential cmake
sudo apt install -y python2-dev python3-dev

# install clang-format
sudo apt install -y clang-format

# install YCM
# $HOME/.vim/plugged/YouCompleteMe/install.py --clang-completer

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -L git.io/antigen > "$HOME/antigen.zsh"
ln -sf "$HOME/dot-configuration-files/.zshrc" "$HOME/.zshrc"

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
