#!/bin/bash

# Define characters to be used in the Matrix effect
CHARS="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Function to generate a random character from CHARS
random_char() {
    echo -n "${CHARS:$((RANDOM % ${#CHARS})):1}"
}

# Function to generate a random color code for the terminal
random_color() {
    echo -n "$(tput setaf $((RANDOM % 7 + 1)))"
}

# Function to create a Matrix column
matrix_column() {
    local height=$1
    local delay=$2

    # Loop to generate the column
    for ((i = 0; i < height; i++)); do
        echo -n "$(random_color)$(random_char)"
        sleep $delay
        echo -ne "\033[1A\033[2C"
    done
}

# Main function
main() {
    # Get terminal dimensions
    local width=$(tput cols)
    local height=$(tput lines)

    # Set delay based on terminal height
    local delay=$(echo "scale=2; 0.1 * $height / 50" | bc)

    # Infinite loop to create Matrix effect
    while true; do
        # Randomly select a column to start
        local start_col=$((RANDOM % width))
        # Generate a Matrix column
        (matrix_column $height $delay) & disown
        # Move to the next column
        tput sc
        tput cup 0 $start_col
        tput rc
    done
}

# Run the main function
main

