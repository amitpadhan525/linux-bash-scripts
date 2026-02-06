#!/bin/bash
# Question: Read a single line of text and display the first word.

read -r text
echo $text | cut -d' ' -f1
