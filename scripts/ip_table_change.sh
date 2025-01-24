#!/bin/bash

# Path to whitelist file
whitelist_file="/etc/nginx/whitelist/only_uzbekistan.conf"
ip_ranges=$(grep '^allow' "$whitelist_file" | awk '{print $2}' | sed 's/;//')

for ip in $ip_ranges
do
    sudo ufw allow from "$ip" to any port 22
done

sudo ufw deny 22
sudo ufw enable