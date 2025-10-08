#!/bin/bash

# Server Performance Stats

# Get CPU usage
CPU_USAGE=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU_USAGE%"

# Get memory usage
MEMORY_USAGE=$(free -m | grep "Mem:" | awk '{print $3}')
echo "Memory Usage: $MEMORY_USAGE MB"

# Get swap usage
SWAP_USAGE=$(free -m | grep "Swap:" | awk '{print $3}')
echo "Swap Usage: $SWAP_USAGE MB"

# Get disk usage
DISK_USAGE=$(df -h | grep "/dev/sda1" | awk '{print $5}')
echo "Disk Usage: $DISK_USAGE"

# Get Top5 CPU-consuming processes
TOP5_PROCESSES=$(top -b -n 1 | awk 'NR>7 {print $0}' | sort -k9,9nr | head -n 5)
echo "Top 5 CPU-consuming processes: $TOP5_PROCESSES"

# Get Top5 Memory-consuming processes
TOP_PROCESSES=$(top -b -n 1 | awk 'NR>7 {print $0}' | sort -k10,10nr | head -n 5)
echo "Top 5 Memory-consuming processes: $TOP_PROCESSES"
