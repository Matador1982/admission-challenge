#!/bin/bash
# add a server1 to /etc/hosts 
echo "192.168.60.10   server1" | sudo tee -a /etc/hosts > /dev/null 

#installing sshpass 
# sudo apt update
# sudo apt install sshpass

# set temporary password for vargant user - server1 (pass: 12345678)
echo -e "12345678\n12345678" | sudo passwd vagrant

# Change some configurations into /etc/ssh/sshd_config to make ssh-pass available 
# sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
# sudo sed -i 's/PubkeyAuthentication yes/PubkeyAuthentication no/' /etc/ssh/sshd_config
# sudo service sshd restart
# pass_file1="/home/vagrant/.ssh/ssh_pass_for_server1"
# pass_file2="/home/vagrant/.ssh/ssh_pass_for_server2"
#copy files from server1
# sshpass -p '12345678' scp $pass_file1 server1:$pass_file1
# sshpass -p '12345678' scp $pass_file2 server1:$pass_file2

#lock permission
chmod 400 $pass_file2
chmod 400 $pass_file1
#run file on server1 to change the pass there
# sshpass -p '12345678' ssh server1 '/home/vagrant/.ssh/change_pass.sh'




# password=$(cat $"/home/vagrant/.ssh/ssh_pass_for_server2")

# Change the password for vagrant user on server2
# echo "vagrant:$password" | sudo chpasswd
