#!/bin/bash
TARGET_DIR=${1:-"."}
DIR_NAME=$(basename "$TARGET_DIR")
OUTPUT_FILE="${DIR_NAME}_tree.txt"
echo "Generating map for: $TARGET_DIR"
tree "$TARGET_DIR" -I 'venv|node_modules|__pycache__|.git' -L 3 > "$OUTPUT_FILE"
echo "Success: Created $OUTPUT_FILE"
