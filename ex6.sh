#!/bin/bash

# Check if 'at' command is installed
if ! command -v at &> /dev/null; then
    echo "Error: 'at' command is not installed. Please install it first."
    exit 1
fi

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <python_script_path> <datetime>"
    echo "Example: $0 /path/to/script.py '2025-03-10 14:30'"
    exit 1
fi

PYTHON_SCRIPT=$1
DATETIME=$2

# Validate Python script existence
if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "Error: Python script does not exist."
    exit 1
fi

# Convert datetime format if needed
FORMATTED_DATETIME=$(date -d "$DATETIME" "+%H:%M %Y-%m-%d" 2>/dev/null)

if [ -z "$FORMATTED_DATETIME" ]; then
    echo "Error: Invalid datetime format."
    exit 1
fi

# Schedule the task with 'time' command and log output
echo "/usr/bin/time -v python3 $PYTHON_SCRIPT > ./log.txt 2>&1" | at "$FORMATTED_DATETIME"

if [ $? -eq 0 ]; then
    echo "Task scheduled successfully for $FORMATTED_DATETIME"
    echo "Execution log will be available at ./log.txt"
else
    echo "Failed to schedule task."
    exit 1
fi
