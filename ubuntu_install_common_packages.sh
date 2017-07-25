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
clang-format-3.9
apt-file
aptitude
autoconf
automake
espeak
exuberant-ctags
g++
git
git-sh
htop
ipython
libevent-dev
libncurses5-dev
openssh-client
openssh-server
python-pip
subversion
tmux
xclip
imagemagick
)

for p in ${packages[*]}; do
    echo $p
    apt-get install -y $p
done

apt-get -f install
apt-get autoremove -y
apt-get clean -y


# for vim configurations
#bash ./compile_vim.sh

# for tmux configurations
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
