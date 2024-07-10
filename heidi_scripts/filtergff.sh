#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 input_gff_file locus_tags_file output_gff_file"
    exit 1
fi

# input files 
INFILE=$1 #input gff from prokka
locus_tags_file=$2 #locus_tags cut from pseudofinder (_intact.gff)
output_gff=$3 #desired output file name

##these copied from McKayl's script
mapfile -t locus_tags < "$locus_tags_file" # Extracts locus tags from the text file into an array
# Function to check if a line contains any of the locus tags
contains_locus_tag() {
    local line="$1"
    for tag in "${locus_tags[@]}"; do
        if [[ "$line" == *"$tag"* ]]; then
            return 0
        fi
    done
    return 1
}

#if else stuff??
while read -r LINE; do
if [[ "$LINE" == 'gnl'* ]]; then
    if contains_locus_tag "$LINE"; then #if line contains text from line locustags.txt
      echo "$LINE" >> "$output_gff"
    fi
  else
    echo "$LINE" >> "$output_gff"
fi
done < "$INFILE"
