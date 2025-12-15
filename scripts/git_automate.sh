#!/bin/bash

FOLDERS=(
    "$HOME/Documents/Notes"
    "$HOME/Documents/dotfiles"
    "$HOME/Documents/42-Exams"
)

for folder in "${FOLDERS[@]}"; do
    echo "--- Syncing $folder ---"
    cd "$folder" || continue

    git pull
    git add .
    git commit -m "Auto-sync: $(date)"
    git push
done

