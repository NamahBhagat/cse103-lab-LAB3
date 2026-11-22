#!/bin/bash
# System report script

echo "===== SYSTEM REPORT ====="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo ""

echo "--- CPU INFO ---"
grep -m 1 "model name" /proc/cpuinfo | awk -F: '{print "Model:" $2}'
echo "Cores: $(grep -c ^processor /proc/cpuinfo)"
echo ""

echo "--- MEMORY USAGE ---"
free -h | awk 'NR<=2'
echo ""

echo "--- DISK USAGE ---"
df -h / | awk 'NR<=2'
echo ""

echo "--- TOP 5 PROCESSES (by memory) ---"
ps aux --sort=-%mem | awk 'NR<=6 {print $1, $2, $3, $4, $11}'
echo ""

echo "--- UPTIME ---"
uptime -p
