#!/usr/bin/env bash

# Define log file - Make sure to specify a file, not just a directory
mkdir -p /home/tdrobertso42/logs
LOGFILE="/home/tdrobertso42/logs/deployment.log"

# Prompt for environment selection
echo "Select the environment:"
echo "1) Dev"
echo "2) Test"
echo "3) Prod"
read -p "Enter choice (1/2/3): " env_choice

# Determine the playbook and branch based on the choice
case $env_choice in
    1)
        PLAYBOOK="playbook-dev.yml"  # Make sure this file exists
        BRANCH="dev"
        ;;
    2)
        PLAYBOOK="playbook-test.yml"  # Make sure this file exists
        BRANCH="test"
        ;;
    3)

        PLAYBOOK="playbook-prod.yml"  # Make sure this file exists
        BRANCH="main"
        ;;
    *)
        echo "Invalid selection."
        exit 1
        ;;
esac

# Check if the playbook exists
if [ ! -f "$PLAYBOOK" ]; then
    echo "Error: Playbook $PLAYBOOK not found."
    exit 1
fi

# Run the Ansible playbook with the selected branch and log output
ansible-playbook $PLAYBOOK --extra-vars "branch=$BRANCH" | tee -a $LOGFILE

# Check if the playbook run was successful
if [ "${PIPESTATUS[0]}" != "0" ]; then
    echo "Error occurred. Check the log for details."
    exit 1
fi

echo "Deployment successful."