#!/bin/bash

echo "|| CPU information ||"

# modle name
lscpu | grep "Model name" | sed 's/: */: /'
# CPU core
echo "CPU cores: "$(lscpu | grep "Core(s) per socket" | sed 's/.*: *//')
# CPU thread
echo "CPU cores: "$(lscpu | grep "^CPU(s):" | sed 's/.*: *//')
# Virtualization
echo "Virtualization: $(lscpu | grep Virtualization | sed 's/.*: *//')"
# frequncy
lscpu | grep -i "mhz" | sed 's/: */: /'
# cache
lscpu | grep cache | sed 's/: */: /'