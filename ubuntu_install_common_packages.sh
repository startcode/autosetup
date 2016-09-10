#!/usr/bin/env bash
set -e
if (( EUID != 0 )); then
   echo "You must be root to do this." 1>&2
   exit 100
fi

apt-get update
apt-get upgrade -y
sudo apt-get dist-upgrade -y

packages=(
ack-grep
apt-file
aptitude
autoconf
automake
espeak
exuberant-ctags
g++
git
git-sh
ipython
libevent-dev
libncurses5-dev
openssh-client
openssh-server
python-pip
subversion
tmux
vim
xclip
)

for p in ${packages[*]}; do
    echo $p
    apt-get install -y $p
done

apt-get -f install
apt-get autoremove -y
apt-get clean -y

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp vimrc ~/.vimrc
vim +PluginInstall +qall

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
