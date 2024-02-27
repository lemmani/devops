#!/bin/bash

# Define timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Define output file name with timestamp
report_file="system_report_${timestamp}.txt"

# Gather system information and redirect output to the report file
echo "Generating system report..."
{
    echo "=== System Report ==="
    echo "Timestamp: $timestamp"
    echo ""
    echo "=== CPU Usage ==="
    top -l 1 | grep "CPU usage" | cut -c 11-
    echo ""
    echo "=== Memory Usage ==="
    vm_stat
    echo ""
    echo "=== Disk Space ==="
    df -h
    echo ""
    echo "=== Running Processes ==="
    ps aux
} > "$report_file"

echo "System report generated: $report_file"

