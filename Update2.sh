#!/bin/bash

# Jenkins string parameter - hostname of the server to SSH into
TARGET_HOSTNAME=${TARGET_HOSTNAME}

# SSH into the target server as root and run yum update
if [ -z "$TARGET_HOSTNAME" ]; then
    echo "TARGET_HOSTNAME parameter is missing"
    exit 1
fi

# SSH into the server and execute the command
ssh -o StrictHostKeyChecking=no root@"$TARGET_HOSTNAME" 'yum update -y'

# Exit with the SSH command's exit code
exit $?
