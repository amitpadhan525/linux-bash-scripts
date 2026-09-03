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


