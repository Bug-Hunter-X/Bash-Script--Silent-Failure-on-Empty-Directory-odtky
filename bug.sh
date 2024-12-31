#!/bin/bash

# This script attempts to process files in a directory, but contains a subtle error.
# It uses a loop to process files, but doesn't handle the case where the directory is empty.

find . -maxdepth 1 -type f -print0 | while IFS= read -r -d $'
0' file; do
  echo "Processing: $file"
  # ... some file processing ...
  if [[ $? -ne 0 ]]; then
    echo "Error processing $file"
    exit 1
  fi
 done

# Additional commands after the loop
echo "Completed"