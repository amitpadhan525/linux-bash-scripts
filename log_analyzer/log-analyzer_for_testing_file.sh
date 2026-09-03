#!/bin/bash 

echo "==== SSH LOGIN ANALYZER ===="

if [ -z "$1" ]; then
  echo "[ERROR] No argument provided"
  exit 1
fi 

if [ ! -f "$1" ];then 
  echo "[ERROR] No argument exist"
  exist 1
fi

echo 
echo "Top attacking IPs"
grep "Failed password" "$1" | awk '{print $11}' | sort | uniq -c | sort -nr

echo 
echo "Most targeted users:"
grep "Failed password" "$1" | awk '{print $9}' | sort | uniq -c | sort -nr 
