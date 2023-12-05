#!/usr/bin/env bash

# Open the ssh agent
eval "$(ssh-agent -s)"
# Add the ssh key to the agent for root user
ssh-add /root/.ssh/id_rsa

