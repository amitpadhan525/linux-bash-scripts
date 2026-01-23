#!/bin/bash

echo "|| CPU information ||"

# model name
lscpu | grep "Model name" | sed 's/: */: /'

# vendor
lscpu | grep "Vendor ID" | sed 's/: */: /'

# architecture
lscpu | grep "Architecture" | sed 's/: */: /'

# CPU cores per socket
echo "CPU cores per socket: $(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')"

# total CPUs / threads
echo "CPU threads: $(lscpu | grep "^CPU(s):" | sed 's/.*: *//')"

# threads per core
echo "Threads per core: $(lscpu | grep "Thread(s) per core" | sed 's/.*: *//')"

# sockets
echo "Sockets: $(lscpu | grep "Socket(s)" | sed 's/.*: *//')"

# virtualization
echo "Virtualization: $(lscpu | grep "Virtualization:" | sed 's/.*: *//')"

# virtualization type
echo "Virtualization type: $(lscpu | grep "Virtualization type" | sed 's/.*: *//')"

# frequency
lscpu | grep -i "mhz" | sed 's/: */: /'

# cache
lscpu | grep cache | sed 's/: */: /'
