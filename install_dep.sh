#!/bin/bash

##PROGRAM STARTS HERE
neofetch --ascii_distro archlinux
echo $(date)
umask_val=$(sudo su root -c umask)
echo "umask = "$umask_val


##GETTING THE SCRIPT READY
distro_type=$(cat /etc/*-release | grep DISTRIB_ID=Ubuntu)
echo $distro_type
echo "Using apt packet manager to install packages!!"

if [[ $distro_type == "DISTRIB_ID=Ubuntu" ]]; then
     sudo apt update
     sudo apt upgrade -y
     sudo apt autoclean -y
     sudo apt autoremove -y
     xargs sudo apt-get install -y <http://172.105.170.242/LinodeServer/package_list.txt
else
    sudo pacman -Syu
    sudo pacman -Syyu
    echo "You most likely have an arch system, meaning package names may differ"
    echo "Unable to install packages!!"
fi


##TESTING NETWORK DISCOVERY

echo "PINGING UNITS!!"


##Avara Unit1
HOST1=10.20.212.50
##Avara Unit2
HOST2=10.20.212.60
##Avara Unit3
HOST3=10.20.212.61
##Avara Unit4
HOST4=10.20.212.62
##DarkHelmet
HOST5=192.168.0.20
##Linode Cloud Server
HOST6=172.105.170.242

##Testing Ping     
myArray=("$HOST1" "$HOST2" "$HOST3" "$HOST4" "$HOST5" "$HOST6")

for i in "${myArray[@]}"
do
    sudo ping $i -c 1 >> /log/network.log
    ping -c1 $i 1>/dev/null 2>/dev/null
    SUCCESS=$?
    if [ $SUCCESS -eq 0 ]
    then
        echo "\n"
        echo "$i has replied"
    else
        echo "$i didn't reply, check /log/network.log"
    fi
    sudo nmap $i >> /log/security.log  
    
  
done
echo "nmap report in /log/security.log"
git status
read -p "Would you like to add any files to the git repository?: (Y/N)" git_add
if [[ $git_add == "Y" || $git_add == "y" ]]
    then
        git add .
        git status
    elif [[ $git_add == "N" || $git_add == "n" ]]
        then
            echo "Ok"
fi

read -p "Would you like to commit any files to the git repository?: (Y/N)" git_commit

if [[ $git_commit == "Y" || $git_commit == "y" ]]
    then
    read -p "Name of commit?: " commit_message 
        git commit -m "$commit_message"
        git status
    elif [[ $git_commit == "N" || $git_commit == "n" ]]
    then
        echo "Ok"
fi

