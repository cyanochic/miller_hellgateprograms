#!/bin/bash

# Check if correct number of arguments provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

# Create a temporary file
temp_file=$(mktemp)

# Keep lines that match the criteria and overwrite the input file
awk '/^##gff-version 3$/ || ($8 ~ /^[0-2]$/) || /^##FASTA$/ || /^>/ || /^[ACGT]/ {print}' "$input_file" > "$temp_file"

# Replace the original input file with the temporary file
mv "$temp_file" "$input_file"

echo "Filtered content saved to $input_file"
