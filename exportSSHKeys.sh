#!/bin/bash
# Add SSH keys to remote servers
SERVER_LIST="10.128.0.24 10.128.0.23"  # Replace with your server IPs or hostnames

# Loop through servers and add SSH keys
for server in $SERVER_LIST; do
    ssh-copy-id root@$server
done
