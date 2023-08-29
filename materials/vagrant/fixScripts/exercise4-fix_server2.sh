#!/bin/bash
# add a server1 to /etc/hosts 
echo "192.168.60.10   server1" | sudo tee -a /etc/hosts > /dev/null 

# set password for vargant user - server1 (pass: 12345678)
echo -e "12345678\n12345678" | sudo passwd vagrant
# scp sshpass -p 'pass' -i vagrant@server1:/home/vagrant/pass_server1.txt 
# Change some configurations into /etc/ssh/sshd_config to make ssh-pass avaiable 
  sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  sudo service sshd restart
