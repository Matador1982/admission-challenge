#!/bin/bash

# add a server2 to /etc/hosts 
 echo "192.168.60.11   server2" | sudo tee -a /etc/hosts > /dev/null 

# set temporary password for vargant user - server1 (pass: 12345678)
# echo -e "12345678\n12345678" | sudo passwd vagrant

#create a random pass ino the file on (password for server2)
#pass_file1="/home/vagrant/.ssh/ssh_pass_for_server1"
#pass_file2="/home/vagrant/.ssh/ssh_pass_for_server2"
#openssl rand -base64 32 > $pass_file1
#openssl rand -base64 32 > $pass_file2

#lock permission
#chmod 400 $pass_file2
#chmod 400 $pass_file1

# Change some configurations into /etc/ssh/sshd_config to make ssh-pass available 
# sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# sudo sed -i 's/PubkeyAuthentication yes/PubkeyAuthentication no/' /etc/ssh/sshd_config
# sudo service sshd restart

#creating the script file that changes the vagrant user password from server2 

# Contents of the script to be generated that 
#script_content="#!/bin/bash

# Read the password from passfile
#password=$(cat $"/home/vagrant/.ssh/ssh_pass_for_server1")

# Change the password for vagrant user on server1
#echo "vagrant:$password" | sudo chpasswd


# Path where you want to create the script file
# script_path="/home/vagrant/.ssh/change_pass.sh"

# Create the script file with the desired content
#echo "$script_content" > "$script_path"

# Make the script file executable
# chmod +x "$script_path"


# echo "You can use this command to connect server2 via pass into the file: sshpass -f $pass_file2 ssh server2"

