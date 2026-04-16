#!/bin/bash

echo "|| CPU information ||"
echo

# general info
echo "Model name: $(lscpu | grep "Model name" | sed 's/.*: *//')"
echo "Vendor ID: $(lscpu | grep "Vendor ID" | sed 's/.*: *//')"
echo "Architecture: $(lscpu | grep "Architecture" | sed 's/.*: *//')"
echo "Byte Order: $(lscpu | grep "Byte Order" | sed 's/.*: *//')"
echo "BogoMIPS: $(lscpu | grep "BogoMIPS" | sed 's/.*: *//')"

echo
echo "|| CPU topology ||"
echo

# topology
echo "CPU threads: $(lscpu | grep "^CPU(s):" | sed 's/.*: *//')"
echo "CPU cores per socket: $(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')"
echo "Threads per core: $(lscpu | grep "Thread(s) per core" | sed 's/.*: *//')"
echo "Sockets: $(lscpu | grep "^Socket(s):" | sed 's/.*: *//')"
echo "NUMA node(s): $(lscpu | grep "NUMA node(s):" | sed 's/.*: *//')"

echo
echo "|| Virtualization & Features ||"
echo

# virtualization and features
echo "Virtualization: $(lscpu | grep "Virtualization:" | sed 's/.*: *//')"
echo "Virtualization type: $(lscpu | grep "Virtualization type" | sed 's/.*: *//')"
echo "Stepping: $(lscpu | grep "Stepping:" | sed 's/.*: *//')"

echo
echo "|| Clocks & Caches ||"
echo

# frequency
echo "Current CPU MHz: $(lscpu | grep "^CPU MHz" | sed 's/.*: *//')"
echo "Max CPU MHz: $(lscpu | grep "CPU max MHz" | sed 's/.*: *//')"
echo "Min CPU MHz: $(lscpu | grep "CPU min MHz" | sed 's/.*: *//')"

# cache
echo "L1d Cache: $(lscpu | grep "L1d" | head -n 1 | sed 's/.*: *//')"
echo "L1i Cache: $(lscpu | grep "L1i" | head -n 1 | sed 's/.*: *//')"
echo "L2 Cache: $(lscpu | grep "L2 cache" | sed 's/.*: *//')"
echo "L3 Cache: $(lscpu | grep "L3 cache" | sed 's/.*: *//')"
