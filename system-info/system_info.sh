#!/bin/bash

# Improved System Info Script (Clean Version)

# Gather data
HOSTNAME=$(hostnamectl --static 2>/dev/null || hostname)
USER=$(whoami)
SHELL_NAME=$(basename "$SHELL")
KERNEL=$(uname -r)
ARCH=$(uname -m)
UPTIME=$(uptime -p | sed 's/up //')
LOAD=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')
PROCS=$(ps aux | wc -l)
USERS=$(who | wc -l)

# OS Info
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_NAME="$NAME"
    OS_VER="$VERSION"
fi

# RAM
RAM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
RAM_USED=$(free -h | awk '/Mem:/ {print $3}')

# Disk
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')

# Network
INTERFACE=$(ip route 2>/dev/null | grep default | awk '{print $5}' | head -n 1)
IP=$(ip -4 addr show "$INTERFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

echo "------------------------------------------------"
echo "           SYSTEM INFORMATION SUMMARY"
echo "------------------------------------------------"
printf "%-18s : %s\n" "Hostname" "$HOSTNAME"
printf "%-18s : %s\n" "User" "$USER"
printf "%-18s : %s\n" "OS" "$OS_NAME $OS_VER"
printf "%-18s : %s (%s)\n" "Kernel" "$KERNEL" "$ARCH"
printf "%-18s : %s\n" "Uptime" "$UPTIME"
printf "%-18s : %s\n" "Load Average" "$LOAD"
echo "------------------------------------------------"
printf "%-18s : %s / %s\n" "Memory (Used/Tot)" "$RAM_USED" "$RAM_TOTAL"
printf "%-18s : %s / %s\n" "Disk (Used/Tot)" "$DISK_USED" "$DISK_TOTAL"
printf "%-18s : %s\n" "Processes" "$PROCS"
printf "%-18s : %s\n" "Logged Users" "$USERS"
echo "------------------------------------------------"
printf "%-18s : %s\n" "Main IP" "${IP:-N/A}"
printf "%-18s : %s\n" "Interface" "${INTERFACE:-N/A}"
echo "------------------------------------------------"
