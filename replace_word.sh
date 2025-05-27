#!/bin/bash

# Check if a file name was provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: ./replace_word.sh filename"
    exit 1
fi

# Save the file name from the first argument
FILE="$1"

# Create a backup of the original file
cp "$FILE" "${FILE}.bak"
echo "Backup created: ${FILE}.bak"

# Use awk to process the file
awk '
# For lines 1 to 4, print them as they are
NR < 5 {
    print
}

# For lines 5 and onward
NR >= 5 {
    # If the line contains the word "welcome"
    if ($0 ~ /welcome/) {
        # Replace all occurrences of "give" with "learning"
        gsub(/give/, "learning")
    }
    # Print the (possibly modified) line
    print
}
' "$FILE" > temp_file

# Replace the original file with the modified version
mv temp_file "$FILE"
echo "File '$FILE' has been updated successfully."
