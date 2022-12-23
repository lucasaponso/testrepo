#!/bin/bash

distro_type=$(cat /etc/*-release | grep DISTRIB_ID=Ubuntu)
echo $distro_type
echo "Using apt packet manager to install packages!!"
if [[ $distro_type == "DISTRIB_ID=Ubuntu" ]]; then
     sudo apt update
     sudo apt upgrade -y
     sudo apt autoclean -y
     sudo apt autoremove -y
     wget http://172.105.180.73/package_list.txt
     xargs sudo apt-get install -y <package_list.txt 
     rm package_list.txt
else
    sudo pacman -Syu
    sudo pacman -Syyu
    echo "You most likely have an arch system, meaning package names may differ"
    echo "Unable to install packages!!"
fi