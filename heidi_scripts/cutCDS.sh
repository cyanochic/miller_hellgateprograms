#!/bin/bash

# Input directory containing files to be processed
input_dir="input_directory"

# Temporary file for storing filtered lines
temp_file="temp_filtered.txt"

# Loop through each file in the input directory
for file in "$input_dir"/*; do
    # Check if file is a regular file
    if [ -f "$file" ]; then
        # Filter lines with "CDS" in column 3 and save to temporary file
        awk '$3 == "CDS"' "$file" > "$temp_file"
        
        # Overwrite original file with filtered lines
        mv "$temp_file" "$file"
        
        echo "Filtered lines saved to $file"
    fi
done
