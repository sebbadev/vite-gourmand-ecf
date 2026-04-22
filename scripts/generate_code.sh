#!/bin/bash
TARGET_DIR=${1:-"."}
ABS_PATH=$(realpath "$TARGET_DIR")
DIR_NAME=$(basename "$ABS_PATH")
OUTPUT_FILE="${DIR_NAME}_code_snapshot.txt"

echo "--- Generating Full Snapshot for: $DIR_NAME ---"
echo "--- PROJECT STRUCTURE ---" > "$OUTPUT_FILE"
tree "$TARGET_DIR" -I 'venv|node_modules|__pycache__|.git' -L 3 >> "$OUTPUT_FILE"

echo -e "\n--- CODE CONTENT ---" >> "$OUTPUT_FILE"
find "$TARGET_DIR" -type f \( -name "*.py" -o -name "*.sh" \) -not -path "*/venv/*" -not -path "*/__pycache__/*" | while read -r file; do
    echo -e "\n\n--- FILE: $file ---" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
done
echo "Success: Created $OUTPUT_FILE"
