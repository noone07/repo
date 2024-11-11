#!/bin/bash

# Define the remote hostname and Netdata parameters
TARGET_HOSTNAME="<target-hostname-or-IP>"
NETDATA_SCRIPT_URL="https://get.netdata.cloud/kickstart.sh"
CLAIM_TOKEN="xDNhD-0jGfjqIs6lVnHytA9AykYdFqA9lpRgoDYu1Z2RF6fdCT4HPHQEgTQUlWcN-tBihrgLmPa-GNddsfy76a3SwXIrr3xHK1nSLA88Lw0LVhRt-jI0KjmtgPQ8HZ0wKima7Z8"
CLAIM_ROOMS="cc835736-4b90-44d0-acd0-ea15ec3a38c2"
CLAIM_URL="https://app.netdata.cloud"

# SSH into the target host as Jenkins user and execute the commands remotely
ssh -o StrictHostKeyChecking=no jenkins@"$TARGET_HOSTNAME" << EOF
    # Download the Netdata kickstart script to /tmp
    wget -O /tmp/netdata-kickstart.sh "$NETDATA_SCRIPT_URL"

    # Run the downloaded script with the specified options
    bash /tmp/netdata-kickstart.sh --stable-channel \
        --claim-token "$CLAIM_TOKEN" \
        --claim-rooms "$CLAIM_ROOMS" \
        --claim-url "$CLAIM_URL"
EOF
