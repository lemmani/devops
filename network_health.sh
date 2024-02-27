#!/bin/bash

# Email settings
recipient="lemmanuelf@gmail.com"
subject="Network Health Report"

# List of IPs or domain names to ping
targets=("www.sendmesl.com" "8.8.8.8" "192.168.1.254")

# Log file
log_file="network_health.log"

# Function to send email alert
send_email() {
    local message="$1"
    echo "$message" | mail -s "$subject" "$recipient"
}

# Function to perform ping test
ping_test() {
    local target="$1"
    local result=$(ping -c 3 "$target" 2>&1)
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local log_message="[$timestamp] Ping to $target: $result"
    echo "$log_message" >> "$log_file"
    send_email "$log_message"
}

# Perform ping tests for each target
for target in "${targets[@]}"; do
    ping_test "$target"
done

