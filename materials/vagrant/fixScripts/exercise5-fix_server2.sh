#!/bin/bash
# Change some configurations into /etc/ssh/sshd_config to make ssh-pass avaiable 
 sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
 sudo sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/' /etc/ssh/sshd_config
 sudo service sshd restart
 
# set password for vargant user - server1 (pass: 12345678)
  echo -e "12345678\n12345678" | sudo passwd vagrant

# create "config" file into dir : home/vagrant/.ssh$
config_text=$(cat <<EOF
Host server1
 Hostname 192.168.60.10
 port 22
 user vagrant
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

IdentityFile ~/.ssh/server2  
EOF
)
echo "$config_text" > /home/vagrant/.ssh/config

#creating the pair of keys (public + private)
 ssh-keygen -t rsa -b 4096 -C "server2" -f /home/vagrant/.ssh/server2 -N ""

#copy the pablic key to server1
 sudo apt update
 sudo apt install sshpass
# sshpass -p '12345678' ssh-copy-id -i /home/vagrant/.ssh/server2.pub server1
