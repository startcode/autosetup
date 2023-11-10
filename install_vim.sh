#!/usr/bin/env bash

echo -ne '\n' | sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim
