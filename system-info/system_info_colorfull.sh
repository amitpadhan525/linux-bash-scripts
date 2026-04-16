#!/bin/bash

# ===== Colors =====
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
WHITE='\033[1;97m'
RED='\033[1;31m'
BOLD='\033[1m'
RESET='\033[0m'

# Get some variables early to clean up the script
distro_name="Unknown"
if [ -f /etc/os-release ]; then
    source /etc/os-release
    distro_name="$NAME $VERSION"
fi

load_avg=$(cat /proc/loadavg | awk '{print $1", "$2", "$3}')
logged_users=$(who | wc -l)
tty_term=$(echo $TERM)

gpu_info=$(lspci 2>/dev/null | grep -i 'vga\|3d\|display' | sed 's/.*: //' | head -n 1)
if [ -z "$gpu_info" ]; then
    gpu_info="N/A"
fi

def_route=$(ip route 2>/dev/null | grep default | awk '{print $5}' | head -n 1)
main_ip=$(hostname -I | awk '{print $1}')
gateway_ip=$(ip route 2>/dev/null | grep default | awk '{print $3}' | head -n 1)

echo -e "\n${BOLD}${MAGENTA}✦ ✨ SYSTEM OVERVIEW ✨ ✦${RESET}"

# ===== SYSTEM IDENTITY =====
echo -e "\n${BOLD}${YELLOW}▶ SYSTEM IDENTITY${RESET}"
echo -e "${CYAN}Hostname:${RESET}    ${GREEN}$(hostnamectl --static 2>/dev/null || hostname)${RESET}"
echo -e "${CYAN}User:${RESET}        ${GREEN}$(whoami)${RESET}"
echo -e "${CYAN}Shell/Term:${RESET}  ${GREEN}$(basename "$SHELL") / ${tty_term}${RESET}"
echo -e "${CYAN}OS:${RESET}          ${GREEN}${distro_name}${RESET}"
echo -e "${CYAN}Kernel:${RESET}      ${GREEN}$(uname -r) (${BOLD}$(uname -m)${RESET}${GREEN})${RESET}"
echo -e "${CYAN}Uptime:${RESET}      ${GREEN}$(uptime -p | sed 's/up //')${RESET}"
echo -e "${CYAN}Date & Time:${RESET} ${GREEN}$(date +"%d-%a-%Y %H:%M:%S %Z")${RESET}"

# ===== STATUS & PROCESSES =====
echo -e "\n${BOLD}${YELLOW}▶ STATUS & PROCESSES${RESET}"
echo -e "${CYAN}Load Avg:${RESET}    ${RED}${load_avg}${RESET}"
echo -e "${CYAN}Logged In:${RESET}   ${RED}${logged_users} Users${RESET}"
echo -e "${CYAN}Processes:${RESET}   ${RED}$(ps aux | wc -l)${RESET}"

if command -v dpkg >/dev/null; then
    echo -e "${CYAN}Packages:${RESET}    ${RED}$(dpkg-query -f '.\n' -W | wc -l) (dpkg)${RESET}"
elif command -v rpm >/dev/null; then
    echo -e "${CYAN}Packages:${RESET}    ${RED}$(rpm -qa | wc -l) (rpm)${RESET}"
elif command -v pacman >/dev/null; then
    echo -e "${CYAN}Packages:${RESET}    ${RED}$(pacman -Q | wc -l) (pacman)${RESET}"
fi

# ===== HARDWARE =====
echo -e "\n${BOLD}${YELLOW}▶ HARDWARE & RESOURCES${RESET}"
echo -e "${CYAN}CPU Model:${RESET}   ${GREEN}$(lscpu | grep "Model name" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU Cores:${RESET}   ${GREEN}$(nproc) threads${RESET}"
echo -e "${CYAN}GPU:${RESET}         ${MAGENTA}${gpu_info}${RESET}"

# Display Resolution
if command -v xrandr >/dev/null && [ -n "$DISPLAY" ]; then
    echo -e "${CYAN}Resolution:${RESET}  ${MAGENTA}$(xrandr | grep '\*' | awk '{print $1}' | head -n 1)${RESET}"
fi

# ===== MEMORY & STORAGE =====
echo -e "\n${BOLD}${YELLOW}▶ MEMORY & STORAGE${RESET}"
echo -e "${CYAN}RAM Usage:${RESET}   ${WHITE}$(free -h | awk '/Mem:/ {print $3}') / $(free -h | awk '/Mem:/ {print $2}')${RESET}"
echo -e "${CYAN}Swap Usage:${RESET}  ${WHITE}$(free -h | awk '/Swap:/ {print $3}') / $(free -h | awk '/Swap:/ {print $2}')${RESET}"
echo -e "${CYAN}Disk (Root):${RESET} ${WHITE}$(df -h / | awk 'NR==2 {print $3}') / $(df -h / | awk 'NR==2 {print $2}') (${BOLD}$(df -h / | awk 'NR==2 {print $5}')${RESET}${WHITE} Used)${RESET}"

# ===== NETWORK =====
echo -e "\n${BOLD}${YELLOW}▶ NETWORKING${RESET}"
echo -e "${CYAN}Interface:${RESET}   ${BLUE}${def_route:-N/A}${RESET}"
echo -e "${CYAN}Local IP:${RESET}    ${BLUE}${main_ip:-N/A}${RESET}"
echo -e "${CYAN}Gateway:${RESET}     ${BLUE}${gateway_ip:-N/A}${RESET}"

echo -e "\n${BOLD}${GREEN}====================================${RESET}\n"
