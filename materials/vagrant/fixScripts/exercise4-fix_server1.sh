#!/bin/bash
# add a server2 -> for 192.168.60.11 to  /etc/hosts 
echo "192.168.60.11   server2" | sudo tee -a /etc/hosts > /dev/null 

# set password for vargant user - server1 (pass: 12345678)
echo -e "12345678\n12345678" | sudo passwd vagrant

# create "config" file into dir : ~/.ssh$ to accept "StrictHostKeyChecking" automaticaly
config_text=$(cat <<EOF
Host server1
    HostName 192.168.60.11
    User vagrant
    Port 22
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
EOF
)
echo "$config_text" > ~/.ssh/config
# Change some configurations into /etc/ssh/sshd_config to make ssh-pass avaiable 
sudo sed -i '/PubkeyAuthentication no/{
     s/no/yes/ }'   /etc/ssh/sshd_config
