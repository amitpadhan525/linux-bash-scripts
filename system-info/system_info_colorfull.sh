#!/bin/bash

# ===== Colors =====
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
WHITE='\033[1;97m'
BOLD='\033[1m'
RESET='\033[0m'

# ===== BASIC SYSTEM INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ BASIC SYSTEM INFORMATION${RESET}"
echo -e "${CYAN}Hostname:${RESET} ${GREEN}$(hostnamectl --static)${RESET}"
echo -e "${CYAN}Username:${RESET} ${GREEN}$(whoami)${RESET}"
echo -e "${CYAN}Shell:${RESET} ${GREEN}$(basename "$SHELL")${RESET}"

source /etc/os-release
echo -e "${CYAN}OS Name:${RESET} ${GREEN}$NAME${RESET}"

echo -e "${CYAN}Kernel Version:${RESET} ${GREEN}$(uname -r)${RESET}"
echo -e "${CYAN}Architecture:${RESET} ${GREEN}$(uname -m)${RESET}"
echo -e "${CYAN}Uptime:${RESET} ${GREEN}$(uptime -p | sed 's/up //')${RESET}"
echo -e "${CYAN}Date:${RESET} ${GREEN}$(date +"%d-%m-%Y")${RESET}"
echo -e "${CYAN}Time:${RESET} ${GREEN}$(date +"%H:%M:%S")${RESET}"

# ===== HARDWARE INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ HARDWARE INFORMATION${RESET}"
echo -e "${CYAN}CPU Model:${RESET} ${GREEN}$(lscpu | grep "Model name" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU Threads:${RESET} ${GREEN}$(lscpu | grep "^CPU(s):" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU Cores:${RESET} ${GREEN}$(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU Max MHz:${RESET} ${GREEN}$(lscpu | grep "CPU max MHz" | sed 's/.*: *//')${RESET}"

# ===== MEMORY INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ MEMORY INFORMATION${RESET}"
echo -e "${CYAN}Total RAM:${RESET} ${GREEN}$(free -h | awk '/Mem:/ {print $2}')${RESET}"
echo -e "${CYAN}Used RAM:${RESET} ${GREEN}$(free -h | awk '/Mem:/ {print $3}')${RESET}"
echo -e "${CYAN}Free RAM:${RESET} ${GREEN}$(free -h | awk '/Mem:/ {print $4}')${RESET}"
echo -e "${CYAN}Swap Total:${RESET} ${GREEN}$(free -h | awk '/Swap:/ {print $2}')${RESET}"

# ===== STORAGE INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ STORAGE INFORMATION${RESET}"
echo -e "${CYAN}Root Size:${RESET} ${WHITE}$(df -h / | awk 'NR==2 {print $2}')${RESET}"
echo -e "${CYAN}Root Used:${RESET} ${WHITE}$(df -h / | awk 'NR==2 {print $3}')${RESET}"
echo -e "${CYAN}Root Free:${RESET} ${WHITE}$(df -h / | awk 'NR==2 {print $4}')${RESET}"

# ===== GRAPHICS INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ GRAPHICS INFORMATION${RESET}"
echo -e "${CYAN}GPU:${RESET} ${MAGENTA}$(lspci | grep -i 'vga\|3d' | sed 's/.*: //')${RESET}"

# ===== NETWORK INFORMATION =====
echo -e "\n${BOLD}${YELLOW}▶ NETWORK INFORMATION${RESET}"
echo -e "${CYAN}Gateway:${RESET} ${BLUE}$(ip route | grep default | awk '{print $3}')${RESET}"
