#!/bin/bash

# ===== Colors =====
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
BLUE='\033[1;34m'
RED='\033[1;31m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "\n${BOLD}${MAGENTA}🔥 CPU ADVANCED INFORMATION 🔥${RESET}\n"

# ===== CPU BASIC INFO =====
echo -e "${BOLD}${BLUE}--- BASIC INFO ---${RESET}"
echo -e "${CYAN}Model Name:${RESET} ${GREEN}$(lscpu | grep "Model name" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Vendor ID:${RESET} ${GREEN}$(lscpu | grep "Vendor ID" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Architecture:${RESET} ${GREEN}$(lscpu | grep "Architecture" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Byte Order:${RESET} ${GREEN}$(lscpu | grep "Byte Order" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}BogoMIPS:${RESET} ${GREEN}$(lscpu | grep "BogoMIPS" | sed 's/.*: *//')${RESET}"
echo

# ===== CPU TOPOLOGY =====
echo -e "${BOLD}${BLUE}--- TOPOLOGY ---${RESET}"
echo -e "${CYAN}CPU(s) / Threads:${RESET} ${YELLOW}$(lscpu | grep "^CPU(s):" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Core(s) per socket:${RESET} ${YELLOW}$(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Thread(s) per core:${RESET} ${YELLOW}$(lscpu | grep "Thread(s) per core" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Socket(s):${RESET} ${YELLOW}$(lscpu | grep "^Socket(s):" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}NUMA node(s):${RESET} ${YELLOW}$(lscpu | grep "NUMA node(s):" | sed 's/.*: *//')${RESET}"
echo

# ===== CPU FEATURES =====
echo -e "${BOLD}${BLUE}--- FEATURES ---${RESET}"
echo -e "${CYAN}Virtualization:${RESET} ${MAGENTA}$(lscpu | grep "Virtualization:" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Virtualization Type:${RESET} ${MAGENTA}$(lscpu | grep "Virtualization type" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Stepping:${RESET} ${MAGENTA}$(lscpu | grep "Stepping:" | sed 's/.*: *//')${RESET}"
echo

# ===== CPU FREQUENCY =====
echo -e "${BOLD}${BLUE}--- FREQUENCY ---${RESET}"
echo -e "${CYAN}Current CPU MHz:${RESET} ${RED}$(lscpu | grep "^CPU MHz" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Max CPU MHz:${RESET} ${RED}$(lscpu | grep "CPU max MHz" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Min CPU MHz:${RESET} ${RED}$(lscpu | grep "CPU min MHz" | sed 's/.*: *//')${RESET}"
echo

# ===== CACHE =====
echo -e "${BOLD}${BLUE}--- CACHE ---${RESET}"
echo -e "${CYAN}L1d Cache:${RESET} ${GREEN}$(lscpu | grep "L1d" | head -n 1 | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L1i Cache:${RESET} ${GREEN}$(lscpu | grep "L1i" | head -n 1 | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L2 Cache:${RESET} ${GREEN}$(lscpu | grep "L2 cache" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L3 Cache:${RESET} ${GREEN}$(lscpu | grep "L3 cache" | sed 's/.*: *//')${RESET}"
echo

# ===== FLAGS (short preview) =====
echo -e "${BOLD}${BLUE}--- FLAGS ---${RESET}"
echo -e "${CYAN}CPU Flags:${RESET} ${YELLOW}$(lscpu | grep "^Flags:" | sed 's/.*: *//' | cut -c1-100)...${RESET}"
echo
