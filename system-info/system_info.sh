#!/bin/bash

# ===============================
# BASIC SYSTEM INFORMATION
# ===============================
echo "|| BASIC SYSTEM INFORMATION ||"

# Hostname (static system name)
echo "Hostname: $(hostnamectl --static)"

# Current logged-in user
echo "Username: $(whoami)"

# Current shell name (bash, zsh, etc.)
echo "Shell: $(basename "$SHELL")"

# OS name (from /etc/os-release)
source /etc/os-release
echo "OS name: $NAME"

# Kernel version
echo "Kernel version: $(uname -r)"

# System architecture (x86_64, arm64, etc.)
echo "System architecture: $(uname -m)"

# System uptime (human readable)
echo "Uptime: $(uptime -p | sed 's/up //')"

# Date & Time
echo "Date: $(date +"%d-%m-%Y")"
echo "Time: $(date +"%H:%M:%S")"

echo

# ===============================
# HARDWARE INFORMATION
# ===============================
echo "|| HARDWARE INFORMATION ||"

# CPU model name
echo "CPU model: $(lscpu | grep "Model name" | sed 's/.*: *//')"

# Total CPU threads
echo "CPU threads: $(lscpu | grep "^CPU(s):" | sed 's/.*: *//')"

# CPU cores per socket
echo "CPU cores: $(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')"

# CPU frequency (max)
echo "CPU max MHz: $(lscpu | grep "CPU max MHz" | sed 's/.*: *//')"

# ===============================
# MEMORY INFORMATION
# ===============================
echo
echo "|| MEMORY INFORMATION ||"

# Total RAM
echo "Total RAM: $(free -h | awk '/Mem:/ {print $2}')"

# Used RAM
echo "Used RAM: $(free -h | awk '/Mem:/ {print $3}')"

# Free RAM
echo "Free RAM: $(free -h | awk '/Mem:/ {print $4}')"

# Swap total
echo "Swap total: $(free -h | awk '/Swap:/ {print $2}')"

# ===============================
# STORAGE INFORMATION
# ===============================
echo
echo "|| STORAGE INFORMATION ||"

# Root partition size
echo "Root size: $(df -h / | awk 'NR==2 {print $2}')"

# Root used space
echo "Root used: $(df -h / | awk 'NR==2 {print $3}')"

# Root available space
echo "Root available: $(df -h / | awk 'NR==2 {print $4}')"

# ===============================
# GPU INFORMATION
# ===============================
echo
echo "|| GRAPHICS INFORMATION ||"

# GPU model (works on most systems)
echo "GPU: $(lspci | grep -i 'vga\|3d' | sed 's/.*: //')"

# ===============================
# NETWORK INFORMATION
# ===============================
echo
echo "|| NETWORK INFORMATION ||"

# Host IP address
echo "Local IP: $(hostname -I | awk '{print $1}')"

# Default gateway
echo "Gateway: $(ip route | grep default | awk '{print $3}')"
