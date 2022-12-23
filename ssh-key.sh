#!/bin/bash
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


if [ [remove_pwd == 'Y' || remove_pwd == 'y'] ]
then
	rm -rf $(pwd)
else 
	echo "ok"
fi

