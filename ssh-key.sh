#!/bin/bash
ssh-keygen -t ed25519 -C lucasaponso@outlook.com
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
cat ~/.ssh/ed25519.pub

