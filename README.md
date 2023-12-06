Project Title: Automated Server Configuration, Deployment, and Maintenance for Multiple Environments
CSC2510-Final-Project

This repository will include the instructions, files, and visuals needed to set up servers on Google Cloud Platform per CSC2510 Specifications.
The users will be able to set up seven total servers, an ansible management server running centOS to manage package, script deployments, and cron jobs.
three web servers and three web server + database hybrid servers each running Debian OS. These servers will have have Apache2, NodeJS, Git, and MariaDB (hybrid servers) installed via ansible playbooks.
These files make assumptions about the directory layout of your servers, see attached Server Setup Instructions for more information.

ansible_playbooks:
All the Bash Scripts, ansible playbooks, and cron job line needed to setup and run these servers for the specified purposes are provided in this file.

Instruction_Files:
This folder contains the instructions for setting up the servers, running the playbooks, and running the scripts. as well as a document explaining the overall setup, usage, and goals of each provided file and common issues and troubleshooting steps for the servers and ansible playbooks.

Server Setup Instructions:
See this text file for written guidelines on how to set up your server
```
Script and Playbook Instructions:
See this folder for a document explaining the overall setup, usage, and goals of each provided file
```
common_issues_troubleshooting.txt:
This file contains common issues and troubleshooting steps for the servers and ansible playbooks.


hosts.ini:
This file contains the group hosts for the ansible playbooks. The ansible playbooks will run on the hosts specified in this file using their internal IPs as
well as specified ansible user and password settings under the specific [servers:vars] sections. the Internal IP addresses, username and password setup is specific to
class requirements, and should be changed to match your own server setup.

Thanks for dropping by!
