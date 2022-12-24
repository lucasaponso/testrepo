#!/bin/bash

function main {
echo -n "Enter an option (1-5): 
1) Ping Units
2) Create SSH Key
3) Check for dependency
4) Exit
5) Get Latest Kernel"
read OPTION
case $OPTION in

  1)
HOST1=10.20.212.50
HOST2=10.20.212.60
HOST3=10.20.212.61
HOST4=10.20.212.62
HOST5=10.20.220.230
HOST6=10.10.109.20
HOST7=10.10.107.6
HOST9=192.168.0.20
HOST10=172.105.180.73
count=0
myArray=("$HOST1" "$HOST2" "$HOST3" "$HOST4" "$HOST5" "$HOST6" "$HOST7" "$HOST9" "$HOST10")
for i in "${myArray[@]}"
do 
    sudo ping $i -c 1 >> /log/network.log
    ping -c1 $i 1>/dev/null 2>/dev/null
    SUCCESS=$?
    if [ $SUCCESS -eq 0 ]
    then
        echo "$i has replied"
        let "count++"
    else
        echo "$i didn't reply, check /log/network.log"
    fi
    sudo nmap $i >> /log/security.log    
done
echo "$count/9 Successful Pings!!"
main
    ;;

  2)
    read -p "Give me ur email!!!" email_addr
ssh-keygen -t ed25519 -C $email_addr
eval "$(ssh-agent -s)"
FILE=~/.ssh/config

if test -f "$FILE"; then
    echo "Host * 
		AddKeysToAgent yes 
		IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
else
	touch ~/.ssh/config
	echo "Host * 
		AddKeysToAgent yes  
		IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
fi

ssh-add ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub
echo "Would you like to remove the current directory: (Y/N)"
read remove_pwd


if [[ remove_pwd == 'Y' || remove_pwd == 'y' ]]
then
	rm -rf $(pwd)
else 
	echo "ok"
fi
main
    ;;

  3)
distro_type=$(cat /etc/*-release | grep DISTRIB_ID=Ubuntu)
echo $distro_type

if [[ $distro_type == "DISTRIB_ID=Ubuntu" ]]; then
echo "Using apt packet manager to install packages!!"
     sudo apt update
     sudo apt upgrade -y
     sudo apt autoclean -y
     sudo apt autoremove -y
     sudo apt install findutils -y
     wget http://172.105.180.73/package_list.txt
     xargs sudo apt-get install -y <package_list.txt 
     rm package_list.txt
else
    sudo pacman -Syu
    sudo pacman -Syyu
    echo "You most likely have an arch system, meaning package names may differ"
    echo "Unable to install packages!!"
fi
    main
    ;;
    4)
    exit 0
    ;;
    5) 
    mkdir ../linux_kernel_dev
    cd ../linux_kernel_dev
    wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.1.1.tar.xz
    tar xvf linux-*
    rm linux-6.1.1.tar.xz
    cd linux-*
    cp -v /boot/config-$(uname -r) .config
    main

esac


}

main













