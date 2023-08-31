#!/bin/bash
# Change some configurations into /etc/ssh/sshd_config to make ssh-pass avaiable 
  sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  # sudo sed -i 's/PubkeyAuthentication no/PubkeyAuthentication yes/' /etc/ssh/sshd_config
  sudo service sshd restart
  
# set password for vargant user - server1 (pass: 12345678)
   echo -e "12345678\n12345678" | sudo passwd vagrant

# create "config" file into dir : home/vagrant/.ssh$ 
config_text=$(cat <<EOF
Host server2
 Hostname 192.168.60.11
 port 22
 user vagrant
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

IdentityFile ~/.ssh/server1    
EOF
)
echo "$config_text" > /home/vagrant/.ssh/config

#creating the pair of keys (public + private)
# ssh-keygen -t rsa -b 4096 -C "server1" -f /home/vagrant/.ssh/server1 -N ""
# sudo chown vagrant:vagrant server1
 
