# Simple Python program

#!/bin/bash
# Prompt user for name and age
name = input("Enter your name: ")
age = int(input("Enter your age: "))

# Calculate the year when the user will turn 100
current_year = 2023  # Update this with the current year
year_turn_100 = current_year + (100 - age)

# Print a personalized greeting
print(f"Hello, {name}! You will turn 100 years old in the year {year_turn_100}.")
