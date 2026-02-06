#!/bin/bash
# Question: Read a line of text and count the number of words.

read text
echo "$text" | wc -w
