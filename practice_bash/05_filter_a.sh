#!/bin/bash
# Question: Read an integer N, then read N lines. Display lines containing 'a' or 'A'.

read N
for (( i=0; i<N; i++ )); do
    read text
    if [[ "$text" == *[aA]* ]]; then
        echo "$text"
    fi
done
