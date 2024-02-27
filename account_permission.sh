#!/bin/bash

# Function to display user information
display_user_info() {
    echo "Listing user information:"
    echo "-------------------------"
    echo "Username | Last Login Time"
    echo "-------------------------"
    who | awk '{printf "%-10s | %s\n", $1, $3" "$4}'
}

# Function to check file permissions
check_file_permissions() {
    echo ""
    echo "Checking file permissions in sensitive directories..."
    echo "-----------------------------------------------------"
    find /etc /var -type f -perm /o=w -ls 2>/dev/null
    echo "-----------------------------------------------------"
}

# Main function
main() {
    display_user_info
    check_file_permissions
}

# Execute main function
main

