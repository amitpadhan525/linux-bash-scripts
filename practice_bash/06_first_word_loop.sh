#!/bin/bash
# Question: Read lines and display the first word of each line.

while IFS= read -r line;do
    echo "$line" | cut -d' ' -f1
done
