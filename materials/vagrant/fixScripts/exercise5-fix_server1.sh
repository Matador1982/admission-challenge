#!/bin/bash
#creating the pair of keys (public + private)
ssh-keygen -t rsa -b 4096 -C "anton" -f ~/.ssh/anton -N ""

#Edit config ssh file for server2 authorization Indentify
#echo "IdentityFile ~/.ssh/anton" | sudo tee -a ~/.ssh/config

# create "config" file into dir : ~/.ssh$ to accept "StrictHostKeyChecking" automaticaly
config_text=$(cat <<EOF
Host server2
 Hostname 192.168.60.11
 port 22
 user vagrant
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

IdentityFile ~/.ssh/anton    
EOF
)
echo "$config_text" > /home/vagrant/.ssh/config

#copy the pablic key to server2
sudo apt update
sudo apt install sshpass
#sshpass -p '12345678' ssh-copy-id -i ~/.ssh/anton server2
