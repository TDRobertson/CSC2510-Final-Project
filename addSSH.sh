#!/usr/bin/env bash

# Activate SSH agent for key manipulation
eval "$(ssh-agent -s)"

# If SSH key gcp is not present in user home directory
if [ -f ~/.ssh/id_rsa ]
then
  ssh-add ~/.ssh/id_rsa
fi