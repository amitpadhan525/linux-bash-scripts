#!/bin/bash
# Question: Read a line of text and display its third character.

read text
echo $text | cut -c3
