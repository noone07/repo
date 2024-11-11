#!/bin/bash

# Take the IP address as the first input parameter
TARGET_HOSTNAME=$1

# Check if TARGET_HOSTNAME is provided
if [ -z "$TARGET_HOSTNAME" ]; then
    echo "Usage: $0 <TARGET_HOSTNAME>"
    exit 1
fi

# SSH into the server and execute the Ansible playbook
ssh -o StrictHostKeyChecking=no jenkins@"$TARGET_HOSTNAME" << EOF
  ansible-playbook /var/jenkins_home/.ssh/repo/ --connection=local
EOF
