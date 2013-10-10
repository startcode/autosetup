#!/usr/bin/env bash
echo "alias update='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean'" >> ~/.bashrc
echo "alias pull='git pull origin master'" >>~/.bashrc
echo "alias push='git push origin master'" >>~/.bashrc
echo "alias die='sudo shutdown -P 0'" >> ~/.bashrc
echo "alias go='xdg-open'" >> ~/.bashrc
echo "set -o vi" >> ~/.bashrc
source ~/.bashrc
sudo apt-get update
sudo apt-get install git vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
