#!/bin/bash

# Check if an input file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file.dot>"
    exit 1
fi

input_file="$1"

# Verify the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Check if the file has the correct .dot extension
if [[ "$input_file" != *.dot ]]; then
    echo "Error: Input file must have a .dot extension."
    exit 1
fi

# Define the output file
output_file="${input_file%.dot}.png"

# Generate the PNG from the DOT file
if dot -Tpng -Gdpi=600 "$input_file" -o "$output_file"; then
    echo "Graph successfully generated: $output_file"
    
    # Open the output file with an image viewer
    if command -v eog &>/dev/null; then
        eog "$output_file" &
    else
        echo "Note: 'eog' is not installed or available. Please open '$output_file' manually."
    fi
else
    echo "Error: Failed to generate the graph."
    exit 1
fi
