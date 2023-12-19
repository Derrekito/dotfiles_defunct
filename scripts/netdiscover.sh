#!/bin/bash

# Loop through each non-loopback IPv4 address
ip addr | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d'/' | while read IP; do
    # Extract the subnet
    SUBNET=$(echo $IP | cut -f1-3 -d '.')
    # Use nmap to scan for hosts on the same subnet
    nmap -sn $SUBNET.0/24
done
