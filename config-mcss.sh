#!/usr/bin/env bash
sudo apt-get clean
sudo apt-get update
sudo apt-get -y --purge dist-upgrade
sudo apt-get -y install firestarter
sudo apt-get -y install openssh-server
sudo firestarter
sudo apt-get -y install clamav
sudo apt-get -y install clamav-docs
sudo apt-get -y install libpam-cracklib

wget http://www.cse.ohio-state.edu/~rowland/mcss/ubuntu-mcss-1.1.tar.gz
sudo mkdir /opt/mcss
sudo mv ubuntu-mcss-1.1.tar.gz /opt/mcss
cd /opt/mcss
sudo tar -vxzf ubuntu-mcss-1.1.tar.gz
cd ubuntu-mcss-1.1
