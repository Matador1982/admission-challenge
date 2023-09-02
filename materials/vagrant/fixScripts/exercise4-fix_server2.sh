#!/bin/bash
# add a server1 to /etc/hosts 
echo "192.168.60.10   server1" | sudo tee -a /etc/hosts > /dev/null 
#The pass of servers was set to <12345678> in exercise5 , according the provisions on Vagrantfile this script that run before exercise4. 
