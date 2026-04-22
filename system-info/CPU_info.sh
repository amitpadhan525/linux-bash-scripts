#!/bin/bash

# Improved CPU Info Script (Clean Version)

# Gather all info once to optimize
CPU_DATA=$(lscpu)

get_val() {
    echo "$CPU_DATA" | grep -i "^$1" | sed 's/.*: *//' | head -n 1
}

echo "========================================"
echo "          CPU INFORMATION"
echo "========================================"

echo "Model name:           $(get_val "Model name")"
echo "Vendor ID:            $(get_val "Vendor ID")"
echo "Architecture:         $(get_val "Architecture")"
echo "Byte Order:           $(get_val "Byte Order")"
echo "BogoMIPS:             $(get_val "BogoMIPS")"

echo -e "\n--- Topology ---"
echo "CPU threads:          $(get_val "CPU(s):")"
echo "CPU cores per socket: $(get_val "Core(s) per socket")"
echo "Threads per core:     $(get_val "Thread(s) per core")"
echo "Sockets:              $(get_val "Socket(s):")"
echo "NUMA node(s):         $(get_val "NUMA node(s):")"

echo -e "\n--- Virtualization & Features ---"
echo "Virtualization:       $(get_val "Virtualization:")"
echo "Virtualization type:  $(get_val "Virtualization type")"
echo "Stepping:             $(get_val "Stepping:")"

echo -e "\n--- Clocks & Caches ---"
echo "Current CPU MHz:      $(get_val "CPU MHz")"
echo "Max CPU MHz:          $(get_val "CPU max MHz")"
echo "Min CPU MHz:          $(get_val "CPU min MHz")"

echo "L1d Cache:            $(get_val "L1d cache")"
echo "L1i Cache:            $(get_val "L1i cache")"
echo "L2 Cache:             $(get_val "L2 cache")"
echo "L3 Cache:             $(get_val "L3 cache")"

echo -e "\n--- Flags ---"
echo "CPU Flags:            $(get_val "Flags")" | cut -c1-100 | sed 's/$/.../'
echo "========================================"
