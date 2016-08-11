#!/usr/bin/env bash
echo "alias update='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean'" >> ~/.bashrc
echo "alias pull='git pull --rebase origin master'" >>~/.bashrc
echo "alias push='git push origin master'" >>~/.bashrc
echo "alias glog='git log'" >>~/.bashrc
echo "alias gc='git checkout'" >>~/.bashrc
echo "alias gr='git rebase'" >>~/.bashrc
echo "alias grc='git rebase --continue'" >>~/.bashrc
echo "alias ga='git add'" >>~/.bashrc
echo "alias amend='git commit -a --amend'" >>~/.bashrc
echo "alias die='sudo shutdown -P 0'" >> ~/.bashrc
echo "alias ack='ack-grep'" >> ~/.bashrc
echo "alias open='xdg-open'" >> ~/.bashrc
echo "alias sbrc='source ~/.bashrc'" >> ~/.bashrc
echo "set -o vi" >> ~/.bashrc
echo "export VISUAL=vi" >> ~/.bashrc
echo "export EDITO=vi" >> ~/.bashrc
source ~/.bashrc
