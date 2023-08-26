#!/bin/bash
# add a server1 to  /etc/hosts 
echo "192.168.60.10   server1" | sudo tee -a /etc/hosts > /dev/null 
