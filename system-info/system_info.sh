#!/bin/bash

echo "|| BASIC SYSTEM INFORMATION ||"
echo "------------------------------"

# Hostname
echo "Hostname: $(hostnamectl --static 2>/dev/null || hostname)"

# Username
echo "Username: $(whoami)"

# Shell and Terminal
echo "Shell: $(basename "$SHELL")"
echo "Terminal: $(echo $TERM)"

# OS Details
if [ -f /etc/os-release ]; then
    source /etc/os-release
    echo "OS Name: $NAME"
    echo "OS Version: $VERSION"
fi

# Kernel & Architecture
echo "Kernel version: $(uname -r)"
echo "Architecture: $(uname -m)"

# Date & Time
echo "Date: $(date +"%A, %d %B %Y")"
echo "Time: $(date +"%H:%M:%S")"
echo "Timezone: $(date +"%Z %z")"

# Uptime and Load
echo "Uptime: $(uptime -p | sed 's/up //')"
echo "Load Average: $(cat /proc/loadavg | awk '{print $1", "$2", "$3}')"

# Processes and Users
echo "Logged Users: $(who | wc -l)"
echo "Total Processes: $(ps aux | wc -l)"

# Installed Packages
if command -v dpkg >/dev/null; then
    echo "Packages (dpkg): $(dpkg-query -f '.\n' -W | wc -l)"
elif command -v rpm >/dev/null; then
    echo "Packages (rpm): $(rpm -qa | wc -l)"
elif command -v pacman >/dev/null; then
    echo "Packages (pacman): $(pacman -Q | wc -l)"
fi

echo
echo "|| HARDWARE & RESOURCE INFORMATION ||"
echo "-------------------------------------"

# CPU
echo "CPU Model: $(lscpu | grep "Model name" | sed 's/.*: *//')"
echo "CPU Cores: $(nproc)"
echo "CPU Max Freq: $(lscpu | grep "CPU max MHz" | sed 's/.*: *//' 2>/dev/null || echo "N/A")"

# Memory
echo "Total RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo "Used RAM: $(free -h | awk '/Mem:/ {print $3}')"
echo "Free RAM: $(free -h | awk '/Mem:/ {print $4}')"
echo "Swap Total: $(free -h | awk '/Swap:/ {print $2}')"
echo "Swap Used: $(free -h | awk '/Swap:/ {print $3}')"

# Storage
echo "Root Size: $(df -h / | awk 'NR==2 {print $2}')"
echo "Root Used: $(df -h / | awk 'NR==2 {print $3}')"
echo "Root Available: $(df -h / | awk 'NR==2 {print $4}')"
echo "Storage Usage (%): $(df -h / | awk 'NR==2 {print $5}')"

# Graphics
echo "GPU Base: $(lspci 2>/dev/null | grep -i 'vga\|3d\|display' | sed 's/.*: //' | head -n 1)"
if command -v xrandr >/dev/null && [ -n "$DISPLAY" ]; then
    echo "Resolution: $(xrandr | grep '\*' | awk '{print $1}' | head -n 1)"
fi

echo
echo "|| NETWORK INFORMATION ||"
echo "-------------------------"

# Network
interface=$(ip route 2>/dev/null | grep default | awk '{print $5}' | head -n 1)
main_ip=""
if [ -n "$interface" ]; then
    main_ip=$(ip -4 addr show "$interface" 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
fi
echo "Local IP (Primary): ${main_ip:-N/A}"
echo "Gateway: $(ip route 2>/dev/null | grep default | awk '{print $3}' | head -n 1)"

# Mac address
if [ -n "$interface" ]; then
    mac=$(ip link show "$interface" | grep link/ether | awk '{print $2}')
    if [ -n "$mac" ]; then
        echo "MAC Address ($interface): $mac"
    fi
fi
echo
