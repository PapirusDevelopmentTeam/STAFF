#!/usr/bin/env bash

### WARNING Create first your OWN SSH key and setup Github 
### Articles: 
#   https://wiki.archlinux.org/index.php/SSH_keys
#   https://help.github.com/articles/generating-an-ssh-key/

# Install required packages
sudo pacman -S --needed openssh gnupg kwalletmanager kwallet kwalletcli pinentry ksshaskpass

# Install systemd unit
mkdir -p $HOME/.config/systemd/user
cp ssh-agent.service $HOME/.config/systemd/user
systemctl --user enable ssh-agent;systemctl --user start ssh-agent

# Add SSH_ASKPASS
touch $HOME/.bash_profile
echo 'export SSH_ASKPASS="/usr/bin/ksshaskpass"' >> $HOME/.bash_profile

# Running ssh-agent after launch terminal
if [ -e $HOME/.bashrc ] 
then
    echo 'eval `ssh-agent -s` > /dev/null && ssh-add $HOME/.ssh/id_rsa' >> $HOME/.bashrc && source $HOME/.bashrc
fi

# Add ssh config
mkdir $HOME/.ssh; touch $HOME/.ssh/config
echo 'IdentityFile ~/.ssh/id_rsa' >> $HOME/.ssh/config
# Change LOGIN value on your GitHub login
echo 'User LOGIN' >> $HOME/.ssh/config
echo 'ForwardAgent yes' >> $HOME/.ssh/config
