#!/usr/bin/env bash

set -x

sudo apt install zsh
sudo chsh -s $(which zsh) 

# log out and login again.

rm -rf ~/.oh-my-zsh

custom_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

cp ~/.zshrc ~/.backup_zshrc || true

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mv ~/.backup_zshrc ~/.zshrc

mkdir -p ${custom_dir}

git clone https://github.com/zsh-users/zsh-autosuggestions ${custom_dir}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${custom_dir}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${custom_dir}/plugins/zsh-completions
git clone https://github.com/softmoth/zsh-vim-mode.git  ${custom_dir}/plugins/zsh-vim-mode
