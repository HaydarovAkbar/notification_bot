#!/bin/bash

BOT_TOKEN="your_bot_token"
CHAT_ID="chat_id" # your telegram chat id or group id

tail -Fn0 /var/log/auth.log | while read line; do
    if echo "$line" | grep -q "session opened for user"; then
        USER=$(echo "$line" | awk '{print $NF}')
        MESSAGE="User $USER has logged in."
        curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d chat_id="$CHAT_ID" \
            -d text="$MESSAGE"
    elif echo "$line" | grep -q "session closed for user"; then
        USER=$(echo "$line" | awk '{print $NF}')
        MESSAGE="User $USER has logged out."
        curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d chat_id="$CHAT_ID" \
            -d text="$MESSAGE"
    elif echo "$line" | grep -q "Failed password"; then
        IP=$(echo "$line" | awk '{print $(NF-3)}')
        MESSAGE="Failed password attempt from $IP."
        curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d chat_id="$CHAT_ID" \
            -d text="$MESSAGE"
    elif echo "$line" | grep -q "Changed password for user"; then
        USER=$(echo "$line" | awk '{print $NF}')
        MESSAGE="User $USER has changed password."
        curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d chat_id="$CHAT_ID" \
            -d text="$MESSAGE"
    fi

done