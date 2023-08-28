#!/bin/bash
#creating the pair of keys (public + private)
ssh-keygen -t rsa -C "anton"

#Edit config ssh file for server2 authorization Indentify
echo "IdentityFile ~/.ssh/anton" | sudo tee -a ~/.ssh/config

#copy the pablic key to server1
sudo apt install sshpass
ssh-copy-id -i -p '12345678' ~/.ssh/anton server1
sshpass -p '12345678' ssh-copy-id -i ~/.ssh/anton server1

