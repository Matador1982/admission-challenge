#!/bin/bash
# add a server2 to /etc/hosts 
echo "192.168.60.11   server2" | sudo tee -a /etc/hosts > /dev/null 

# set password for vargant user - server1 (pass: 12345678)
echo -e "12345678\n12345678" | sudo passwd vagrant

# create "config" file into dir : ~/.ssh$ to accept "StrictHostKeyChecking" automaticaly
config_text=$(cat <<EOF
Host server2
 Hostname 192.168.60.11
 port 22
 user vagrant
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF
)
echo "$config_text" > /home/vagrant/.ssh/config

# Change some configurations into /etc/ssh/sshd_config to make ssh-pass avaiable 
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd restart
