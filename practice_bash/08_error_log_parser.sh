#!/bin/bash
# Question: Read log lines (Date Level Message). If Level is ERROR, display Date and Message.

while IFS= read -r date level message; do
    if [[ $level == ERROR ]]; then
        echo "$date $message"
    fi
done
