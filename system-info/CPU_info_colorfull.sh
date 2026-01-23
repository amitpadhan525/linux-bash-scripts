#!/bin/bash

# ===== Colors =====
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
RESET='\033[0m'

# ===== CPU BASIC INFO =====
echo -e "${CYAN}Model Name:${RESET} ${GREEN}$(lscpu | grep "Model name" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Vendor ID:${RESET} ${GREEN}$(lscpu | grep "Vendor ID" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Architecture:${RESET} ${GREEN}$(lscpu | grep "Architecture" | sed 's/.*: *//')${RESET}"

# ===== CPU TOPOLOGY =====
echo -e "${CYAN}CPU(s):${RESET} ${GREEN}$(lscpu | grep "^CPU(s):" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Core(s) per socket:${RESET} ${GREEN}$(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Thread(s) per core:${RESET} ${GREEN}$(lscpu | grep "Thread(s) per core" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Socket(s):${RESET} ${GREEN}$(lscpu | grep "Socket(s)" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}NUMA node(s):${RESET} ${GREEN}$(lscpu | grep "NUMA node(s)" | sed 's/.*: *//')${RESET}"

# ===== CPU FEATURES =====
echo -e "${CYAN}Virtualization:${RESET} ${GREEN}$(lscpu | grep "Virtualization:" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}Virtualization Type:${RESET} ${GREEN}$(lscpu | grep "Virtualization type" | sed 's/.*: *//')${RESET}"

# ===== CPU FREQUENCY =====
echo -e "${CYAN}CPU MHz:${RESET} ${GREEN}$(lscpu | grep "^CPU MHz" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU max MHz:${RESET} ${GREEN}$(lscpu | grep "CPU max MHz" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}CPU min MHz:${RESET} ${GREEN}$(lscpu | grep "CPU min MHz" | sed 's/.*: *//')${RESET}"

# ===== CACHE =====
echo -e "${CYAN}L1d Cache:${RESET} ${YELLOW}$(lscpu | grep "L1d cache" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L1i Cache:${RESET} ${YELLOW}$(lscpu | grep "L1i cache" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L2 Cache:${RESET} ${YELLOW}$(lscpu | grep "L2 cache" | sed 's/.*: *//')${RESET}"
echo -e "${CYAN}L3 Cache:${RESET} ${YELLOW}$(lscpu | grep "L3 cache" | sed 's/.*: *//')${RESET}"

# ===== FLAGS (short preview) =====
echo -e "${CYAN}CPU Flags:${RESET} ${MAGENTA}$(lscpu | grep "Flags" | sed 's/.*: *//' | cut -c1-100)...${RESET}"
