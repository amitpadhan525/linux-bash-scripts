#!/bin/bash

# Improved CPU Info Script (Colorful & Premium Version)

# ===== Colors & Styling =====
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
RED='\033[0;31m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
RESET='\033[0m'

# Gather all info once to optimize
CPU_DATA=$(lscpu)

get_val() {
    local val=$(echo "$CPU_DATA" | grep -i "^$1" | sed 's/.*: *//' | head -n 1)
    echo "${val:-N/A}"
}

# Header
echo -e "\n${BOLD}${MAGENTA}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${RESET}"
echo -e "${BOLD}${MAGENTA}┃${RESET}   ${BOLD}${YELLOW}🔥  ADVANCED CPU SYSTEM REPORT  🔥${RESET}                  ${BOLD}${MAGENTA}┃${RESET}"
echo -e "${BOLD}${MAGENTA}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RESET}\n"

# ===== BASIC INFO =====
echo -e "${BOLD}${BLUE}󰻠 BASIC IDENTIFICATION${RESET}"
echo -e "  ${CYAN}Model Name    :${RESET} ${GREEN}$(get_val "Model name")${RESET}"
echo -e "  ${CYAN}Vendor ID     :${RESET} ${GREEN}$(get_val "Vendor ID")${RESET}"
echo -e "  ${CYAN}Architecture  :${RESET} ${GREEN}$(get_val "Architecture")${RESET}"
echo -e "  ${CYAN}BogoMIPS      :${RESET} ${GREEN}$(get_val "BogoMIPS")${RESET}"
echo

# ===== TOPOLOGY =====
echo -e "${BOLD}${BLUE}󰓅 ARCHITECTURE & TOPOLOGY${RESET}"
echo -e "  ${CYAN}Threads       :${RESET} ${YELLOW}$(get_val "CPU(s):")${RESET}"
echo -e "  ${CYAN}Cores/Socket  :${RESET} ${YELLOW}$(get_val "Core(s) per socket")${RESET}"
echo -e "  ${CYAN}Threads/Core  :${RESET} ${YELLOW}$(get_val "Thread(s) per core")${RESET}"
echo -e "  ${CYAN}Sockets       :${RESET} ${YELLOW}$(get_val "Socket(s):")${RESET}"
echo

# ===== FREQUENCY & CACHE =====
echo -e "${BOLD}${BLUE}󰍛 PERFORMANCE & CACHE${RESET}"
echo -e "  ${CYAN}Current Speed :${RESET} ${RED}$(get_val "CPU MHz") MHz${RESET}"
echo -e "  ${CYAN}Max Speed     :${RESET} ${RED}$(get_val "CPU max MHz") MHz${RESET}"
echo -e "  ${CYAN}L1d/L1i Cache :${RESET} ${GREEN}$(get_val "L1d cache") / $(get_val "L1i cache")${RESET}"
echo -e "  ${CYAN}L2/L3 Cache   :${RESET} ${GREEN}$(get_val "L2 cache") / $(get_val "L3 cache")${RESET}"
echo

# ===== VIRTUALIZATION =====
echo -e "${BOLD}${BLUE}󰠱 VIRTUALIZATION${RESET}"
echo -e "  ${CYAN}Support       :${RESET} ${MAGENTA}$(get_val "Virtualization:")${RESET}"
echo -e "  ${CYAN}Type          :${RESET} ${MAGENTA}$(get_val "Virtualization type")${RESET}"
echo

# ===== FLAGS =====
echo -e "${BOLD}${BLUE}󰓆 FEATURES & FLAGS${RESET}"
FLAGS=$(get_val "Flags")
echo -e "  ${CYAN}CPU Flags     :${RESET} ${YELLOW}${FLAGS:0:80}...${RESET}"

echo -e "\n${BOLD}${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
