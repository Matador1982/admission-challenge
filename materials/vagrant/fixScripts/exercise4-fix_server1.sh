#!/bin/bash
# add a server2 to /etc/hosts 
 echo "192.168.60.11   server2" | sudo tee -a /etc/hosts > /dev/null 

# set password for vargant user - server1 (pass: 12345678)
 echo -e "12345678\n12345678" | sudo passwd vagrant

# Change some configurations into /etc/ssh/sshd_config to make ssh-pass available 
  sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  sudo service sshd restart
