#!/bin/bash

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required: <directory> <search string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the provided directory exists and is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Count the total number of files (recursively)
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of lines matching the search string
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

