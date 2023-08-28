#!/bin/bash
#creating the pair of keys (public + private)
ssh-keygen -t rsa -b 4096 -C "anton" -f ~/.ssh/anton -N ""

#Edit config ssh file for server2 authorization Indentify
echo "IdentityFile ~/.ssh/anton" | sudo tee -a ~/.ssh/config

#copy the pablic key to server2
sudo apt install sshpass
#sshpass -p '12345678' ssh-copy-id -i ~/.ssh/anton server2
