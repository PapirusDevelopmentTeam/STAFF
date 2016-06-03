#/bin/bash

# Install required packages
sudo pacman -S openssh gnupg kwalletmanager kwallet kwalletcli pinentry ksshaskpass

# Install systemd unit
cp ssh-agent.service $HOME/.config/systemd/user
systemctl --user enable ssh-agent;systemctl --user start ssh-agent

# Add SSH_ASKPASS
touch $HOME/.bash_profile
echo 'export SSH_ASKPASS="/usr/bin/ksshaskpass"' >> $HOME/.bash_profile

# Running ssh-agent after launch terminal
touch $HOME/.bashrc
echo 'eval `ssh-agent -s` > /dev/null && ssh-add $HOME/.ssh/id_rsa' >> $HOME/.bashrc

# Add ssh config
mkdir $HOME/.ssh; touch $HOME/.ssh/config
echo 'IdentityFile ~/.ssh/id_rsa' >> $HOME/.ssh/config
echo 'User $USER' >> $HOME/.ssh/config
echo 'ForwardAgent yes' >> $HOME/.ssh/config

