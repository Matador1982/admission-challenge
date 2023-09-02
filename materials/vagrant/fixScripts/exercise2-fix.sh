#!/bin/bash
#Remove selfrouting from "www.ascii-art.de"
sudo sed -i '/127.0.0.1 www.ascii-art.de/d' /etc/hosts
