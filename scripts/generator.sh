#!/bin/bash

# Usage: ./replace.sh "search_string" "replace_string" [directory]

SEARCH_STRING="$1"
REPLACE_STRING="$2"
DIRECTORY="${3:-.}"  # Default to current directory if not specified

if [[ -z "$SEARCH_STRING" || -z "$REPLACE_STRING" ]]; then
    echo "Usage: $0 \"search_string\" \"replace_string\" [directory]"
    exit 1
fi

# Check if running on macOS
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS version of sed requires -i '' (no space between -i and '')
    SED_CMD="sed -i ''"
else
    # Linux version of sed uses -i without ''
    SED_CMD="sed -i"
fi

# Fix illegal byte sequence error by setting LC_ALL=C
export LC_ALL=C

# Find and replace in text files
find "$DIRECTORY" -type f -exec sh -c "$SED_CMD \"s/${SEARCH_STRING}/${REPLACE_STRING}/g\" \"{}\"" \;

echo "Replacement complete."
