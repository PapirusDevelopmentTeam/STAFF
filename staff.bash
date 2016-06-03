#!/usr/bin/env bash
# WARNING This script will download all repositories **PapirusDevelopmentTeam** via SSH.
# ATTENTION Launch this script _ALWAYS_ before make any changes in local repos. 
# ATTENTION This tool will automatically merge latest changes to the local repository OR just download it.

SSH_ACCESS="git@github.com:PapirusDevelopmentTeam"
REPO=(papirus-aurorae-theme papirus-bomi-skin papirus-color-scheme papirus-gtk-theme papirus-icon-theme-gtk papirus-icon-theme-gtk papirus-icon-theme-kde papirus-k3b-theme papirus-kmail-theme papirus-konsole-colorscheme papirus-libreoffice-theme papirus-look-and-feel papirus-plasma-theme papirus-qtcurve-theme papirus-sddm-theme papirus-smplayer-theme papirus-vlc-theme papirus-wallpapers papirus-yakuake-theme PKGBUILDs)

for r in ${REPO[@]}
do 
    if [ ! -d "$r" ]; then
        git clone $SSH_ACCESS/$r
    else
        echo "DIR $r exists"
        cd $r && git pull && cd ..
    fi
done
