#!/bin/bash

FOLDERS=(
    "$HOME/Documents/Notes"
    "$HOME/Documents/dotfiles"
)

for folder in "${FOLDERS[@]}"; do
    echo "--- Syncing $folder ---"
    cd "$folder" || continue

    git pull
    git add .
    git commit -m "Auto-sync: $(date)"
    git push
done

