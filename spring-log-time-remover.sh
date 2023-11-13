#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file="$1"

if [ ! -f "$log_file" ]; then
    echo "File not found: $log_file"
    exit 1
fi

# output file name + "no-time" suffix
output_file="${log_file%.*}+no-time.${log_file##*.}"

# Run the sed command to remove timestamps
sed 's/^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}[.,]\{1\}[0-9]\{3\} //' "$log_file" > "$output_file"

echo "Processed file saved as: $output_file"
