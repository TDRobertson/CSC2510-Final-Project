#!/usr/bin/env bash

# Activate SSH agent for key manipulation
eval "$(ssh-agent -s)"


# Add SSH key to agent
ssh-add ~/.ssh/id_rsa
=======

