#!/bin/bash

apt-get update -y && apt-get upgrade -y

# Install Git, Dependencies, TMux and Vim
apt-get -y install git gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils libcap2 tmux vim

git config --global core.editor "vim"

echo 'Configuring Git'
echo 'Git User Name'
read gitname
git config --global user.name $gitname
echo 'Get Email (No-Reply)'
read gitemail
git config --global user.email $gitemail

# Download Vimrc File
echo 'Downloading vimrc file'
curl https://raw.githubusercontent.com/chase-childers/hardware-projects/master/laptop/vimrc.conf >> ~/.vimrc

# SCM_Breeze install
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze && ~/.scm_breeze/install.sh
source ~/.bashrc

# Setup Ruby, Python3, NodeJS
sudo apt-get -y install python3 python3-pip ruby nodejs

# Install rbenv
echo 'Setting up RBENV'
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
grep -xqF 'export PATH=$HOME/.rbenv/bin:$PATH' ~/.bashrc || echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> ~/.bashrc
grep -xqF 'eval "$(rbenv init -)"' ~/.bashrc || echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install AWS Cli
pip3 install awscli
aws configure

# Install VS Code
curl -o ~/code.deb -L https://go.microsoft.com/fwlink/?LinkID=760868
apt-get -y install ~/code.deb
rm -rf ~/code.deb

# Setup TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
