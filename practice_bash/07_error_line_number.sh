#!/bin/bash
# Question: Read lines, track line numbers, and display the line number and content for lines containing "ERROR".

count=0
while IFS= read -r line; do
    ((count++))
    if [[ $line == *ERROR* ]]; then
        echo "$count $line"
    fi
done
