#!/bin/bash
# Remove the routing from 208.86.224.90 to 192.168.60.10
sudo ip route del 208.86.224.90/32 dev enp0s8 src 192.168.60.10
