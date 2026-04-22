#!/bin/bash

# Improved System Info Script (Colorful & Premium Version)

# ===== Colors & Styling =====
C1='\033[1;36m' # Cyan
C2='\033[1;32m' # Green
C3='\033[1;33m' # Yellow
C4='\033[1;35m' # Magenta
C5='\033[1;34m' # Blue
C6='\033[1;31m' # Red
W='\033[1;97m'  # White
B='\033[1m'     # Bold
R='\033[0m'     # Reset

# Gather data
HOSTNAME=$(hostnamectl --static 2>/dev/null || hostname)
CUR_USER=$(whoami)
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
    OS_DISPLAY="$NAME $VERSION_ID"
fi

# RAM & Disk
RAM_INFO=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
DISK_INFO=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')

# Network
INTERFACE=$(ip route 2>/dev/null | grep default | awk '{print $5}' | head -n 1)
IP=$(ip -4 addr show "$INTERFACE" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

# Header
echo -e "\n${B}${C4}╭──────────────────────────────────────────────────────────╮${R}"
echo -e "${B}${C4}│${R}  ${B}${W}󰇄  SYSTEM DASHBOARD${R}                                   ${B}${C4}│${R}"
echo -e "${B}${C4}╰──────────────────────────────────────────────────────────╯${R}"

# Section: Identity
echo -e "  ${B}${C5}󰭹 IDENTITY${R}"
printf "  ${C1}%-12s${R} : ${C2}%s${R}\n" "Hostname" "$HOSTNAME"
printf "  ${C1}%-12s${R} : ${C2}%s${R}\n" "User" "$CUR_USER"
printf "  ${C1}%-12s${R} : ${C2}%s${R}\n" "OS" "$OS_DISPLAY"
printf "  ${C1}%-12s${R} : ${C2}%s (%s)${R}\n" "Kernel" "$KERNEL" "$ARCH"

# Section: Status
echo -e "\n  ${B}${C5}󰄔 STATUS${R}"
printf "  ${C1}%-12s${R} : ${C3}%s${R}\n" "Uptime" "$UPTIME"
printf "  ${C1}%-12s${R} : ${C6}%s${R}\n" "Load Avg" "$LOAD"
printf "  ${C1}%-12s${R} : ${W}%s${R}\n" "Processes" "$PROCS"

# Section: Resources
echo -e "\n  ${B}${C5}󰍛 RESOURCES${R}"
printf "  ${C1}%-12s${R} : ${C2}%s${R}\n" "Memory" "$RAM_INFO"
printf "  ${C1}%-12s${R} : ${C2}%s${R}\n" "Disk (/)" "$DISK_INFO"

# Section: Network
echo -e "\n  ${B}${C5}󰀂 NETWORKING${R}"
printf "  ${C1}%-12s${R} : ${C4}%s${R}\n" "Local IP" "${IP:-N/A}"
printf "  ${C1}%-12s${R} : ${C4}%s${R}\n" "Interface" "${INTERFACE:-N/A}"

echo -e "\n${B}${C4}────────────────────────────────────────────────────────────${R}\n"
