#!/bin/bash

# Configuration des chemins
SOURCE="/home/seb/dev/projects/vite-gourmand"
DESTINATION="gdev:dev/projects/vite-gourmand"

echo "🚀 Démarrage de la sauvegarde miroir vers Google Drive..."

# 1. Sauvegarde de la DB
pgdump -u seb_admin -p vite_gourmand > $SOURCE/docs/database/backup_db.sql

# 2. Synchronisation Rclone
rclone sync "$SOURCE" "$DESTINATION" \
    --exclude "/venv/**" \
    --exclude "**/__pycache__/**" \
    --exclude "/dist/**" \
    --exclude "/node_modules/**" \
    --exclude "/.angular/**" \
    --exclude "/.vscode/**" \
    --progress

echo "✅ Sauvegarde terminée avec succès !"