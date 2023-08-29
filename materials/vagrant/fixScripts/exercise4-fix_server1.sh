#!/bin/bash

# add a server2 to /etc/hosts 
 echo "192.168.60.11   server2" | sudo tee -a /etc/hosts > /dev/null 

# set temporary password for vargant user - server1 (pass: 12345678)
# echo -e "12345678\n12345678" | sudo passwd vagrant

#create a random pass ino the file on (password for server2)
pass_file1="/home/vagrant/.ssh/ssh_pass_for_server1"
pass_file2="/home/vagrant/.ssh/ssh_pass_for_server2"
openssl rand -base64 32 > $pass_file1
openssl rand -base64 32 > $pass_file2

#lock permission
chmod 400 $pass_file2
chmod 400 $pass_file1

# Change some configurations into /etc/ssh/sshd_config to make ssh-pass available 
  sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  sudo service sshd restart
echo "You can use this command to connect server2 via pass into the file: sshpass -f $pass_file ssh server2"

