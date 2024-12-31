#!/bin/bash

# Improved script with error handling for empty directory

files=$(find . -maxdepth 1 -type f -print0 | xargs -0)

if [[ -z "$files" ]]; then
  echo "Warning: No files found in the current directory."
  exit 0
fi

while IFS= read -r file; do
  echo "Processing: $file"
  # ... some file processing ...
  if [[ $? -ne 0 ]]; then
    echo "Error processing $file"
    exit 1
  fi
done <<< "$files"

# Additional commands after the loop
echo "Completed"