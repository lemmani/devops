#!/bin/bash

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: ./log_analyzer.sh <access_log_file>"
    exit 1
fi

# Assign the provided access log file path to a variable
access_log_file="$1"

# Check if the access log file exists
if [ ! -f "$access_log_file" ]; then
    echo "Error: Access log file '$access_log_file' not found."
    exit 1
fi

# Analyze the access log file
echo "Analyzing access log file: $access_log_file"
echo "---------------------------------------------"

# Extract the most frequent IP addresses
echo "Most frequent IP addresses:"
awk '{print $1}' "$access_log_file" | sort | uniq -c | sort -nr | head -n 10

echo ""

# Extract the most frequent request URLs
echo "Most frequent request URLs:"
awk '{print $7}' "$access_log_file" | sort | uniq -c | sort -nr | head -n 10

echo ""

# Identify and count occurrences of error codes
echo "Error codes and their occurrences:"
awk '$9 >= 400 {print $9}' "$access_log_file" | sort | uniq -c | sort -nr

echo "---------------------------------------------"


