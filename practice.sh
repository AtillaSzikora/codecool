#!/usr/bin/bash

# === Constants ===
readonly SCRIPT_NAME="$(basename "$0")"
readonly TARGET_EXTENSION=".pdf"

# === Main Logic ===
echo "=== $SCRIPT_NAME: Processing ${TARGET_EXTENSION} files ==="

count=0

for file in *${TARGET_EXTENSION}; do
    # Skip if no matching files (prevents loop on literal "*")
    if [ ! -e "$file" ]; then
        echo "No ${TARGET_EXTENSION} files found."
        break
    fi

    # Get file size using stat or ls
    size=$(stat -c%s "$file" 2>/dev/null || stat -f%z "$file" 2>/dev/null)
    echo "Found: $file (${size} bytes)"
    count=$((count + 1))
done

echo "=== Total: ${count} ${TARGET_EXTENSION} files processed ==="
