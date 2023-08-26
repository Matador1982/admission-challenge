#!/bin/bash
# add a server1 to  /etc/hosts 
echo "192.168.60.10   server1" | sudo tee -a /etc/hosts > /dev/null 

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
sudo ssh-keygen -O PubkeyAuthentication=yes -f /etc/ssh/sshd_config
sudo ssh-keygen -O PasswordAuthentication=yes -f /etc/ssh/sshd_config
sudo ssh-keygen -O ChallengeResponseAuthentication=yes -f /etc/ssh/sshd_config
