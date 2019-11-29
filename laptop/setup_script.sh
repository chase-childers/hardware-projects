#!/bin/bash

apt-get update -y && apt-get upgrade -y

# Install Git, Dependencies, TMux and Vim
apt-get -y install git gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils libcap2 tmux vim

# Download Vimrc File
echo 'Downloading vimrc file'
curl https://raw.githubusercontent.com/chase-childers/hardware-projects/master/laptop/vimrc.conf ~/.vimrc

# TODO: Setup Git for SCM_Breeze install
# git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze && ~/.scm_breeze/install.sh
# source ~/.bashrc

# Setup Ruby, Python3, NodeJS
sudo apt-get -y install python3 python3-pip ruby nodejs

# Install rbenv
echo 'Setting up RBENV'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
grep -xqF 'export PATH=$HOME/.rbenv/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> ~/.bashrc
grep -xqF 'eval "$(rbenv init -)"' ~/.bashrc || echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# TODO: Setup TMUX
# TODO: Install AWS Cli (After Python and Pip)
# TODO: Install VS Code

