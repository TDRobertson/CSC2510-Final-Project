#!/usr/bin/env bash

# Define log file - Make sure to specify a file, not just a directory
mkdir -p /home/tdrobertso42/logs
LOGFILE="/home/tdrobertso42/logs/deployment.log"

# Check if an argument was passed to the script
if [ $# -eq 0 ]; then
    # Prompt for environment selection
    echo "Select the environment:"
    # The choices here should match the branch names in the repository
    # The playbook name should match the branch name with "playbook-" prepended
    # For example, if the branch name is "dev", the playbook name should be "playbook-dev.yml"
    echo "1) Dev"
    echo "2) Test"
    echo "3) Prod"
    # Updates to packages are done in all environments but does not run specific playbooks
    echo "4) Packages for all environments"
    read -p "Enter choice (1/2/3/4): " env_choice
else
    # If an argument was passed, use it as the environment choice
    env_choice=$1
fi

# Determine the playbook and branch based on the choice
case $env_choice in
    1)
        PLAYBOOK="playbook-dev.yml"  # Make sure this file exists in the same directory as this script
        # The dev branch is named "dev" in the repository
        BRANCH="dev"
        ;;
    2)
        PLAYBOOK="playbook-test.yml"  # Make sure this file exists in the same directory as this script
        # The test branch is named "test" in the repository 
        BRANCH="test"
        ;;
    3)

        PLAYBOOK="playbook-prod.yml"  # Make sure this file exists in the same directory as this script
        # The prod branch is named "main" in the repository
        BRANCH="main"
        ;;
    
    4)
        PLAYBOOK="playbook-packages.yml"  # Make sure this file exists in the same directory as this script
        ;;
    *)
        # Exit if an invalid choice is made
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
# The branch is passed as an extra variable to the playbook
ansible-playbook $PLAYBOOK --extra-vars "branch=$BRANCH" | tee -a $LOGFILE

# Check if the playbook run was successful
if [ "${PIPESTATUS[0]}" != "0" ]; then
    echo "Error occurred. Check the log for details."
    exit 1
fi

# If the playbook run was successful, print a success message
echo "Deployment successful."