#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_file output_file"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found"
    exit 1
fi

# Remove lines starting with "##" or "#!"
filtered_content=$(grep -vE '^##|^#!' "$input_file")

# Add "##gff-version 3" at the start of the file
filtered_content="##gff-version 3\n$filtered_content"

# Add "##FASTA" before the first line starting with ">"
filtered_content=$(awk '/^>/ && !fasta {print "##FASTA"; fasta=1} {print}' <<< "$filtered_content")

# Save the output to the new file
echo -e "$filtered_content" > "$output_file"

echo "Processed content saved to '$output_file'"
