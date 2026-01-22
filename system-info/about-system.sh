#!/bin/bash

# BASIC SYSTEM INFORMATION
echo "|| BASIC SYSTEM INFORMATION ||"

# Hostname
echo "Hostname: $(hostnamectl --static)"

# Username
echo "Username: $(whoami)"

# current shell
echo "Shell:" $(basename $SHELL)

# OS name
source /etc/os-release
echo "OS name: $NAME"

# Kernel version
echo "Kenel version: $(uname -r)"

# System architechture
echo "System architecture: $(uname -m)"

# Uptime
echo "Uptime: $(uptime -p | grep -o '[0-9].*')"

# Date & Time
echo "Date: $(date +"%d-%m-%Y")"
echo "Time: $(date +"%H:%M:%S")"

# HARDWARE INFORMATION
echo "|| HARDWARE INFORMATION ||"

# CPU model
echo "CPU model: $(lscpu | grep "Model name" | sed 's/.*: *//')"

# CPU thread
echo "CPU thread: $(lscpu | grep "^CPU(s):" | sed 's/.*: *//')"

# CPU thread

