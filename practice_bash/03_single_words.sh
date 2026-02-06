#!/bin/bash
# Question: Read lines from input and display only those that do not contain spaces.

while IFS= read -r line;do 
    if [[ "$line" != *" "* ]]; then
        echo "$line"
    fi
done
