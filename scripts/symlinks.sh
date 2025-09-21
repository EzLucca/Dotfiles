#!/bin/bash

# Directory where your dotfiles are stored
DOTFILES_DIR="$HOME/dotfiles"

# List of files/folders to symlink
declare -A DOTFILES
DOTFILES[".bashrc"]="$DOTFILES_DIR/.bashrc"
DOTFILES[".tmux.conf"]="$DOTFILES_DIR/.tmux.conf"
DOTFILES[".config/nvim"]="$DOTFILES_DIR/nvim"

# Backup directory for existing files/folders
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Backing up existing dotfiles (if any) to $BACKUP_DIR..."

# Create symlinks
for target in "${!DOTFILES[@]}"; do
    src="${DOTFILES[$target]}"
    dest="$HOME/$target"

    # Backup if exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up $dest"
        mkdir -p "$(dirname "$BACKUP_DIR/$target")"
        mv "$dest" "$BACKUP_DIR/$target"
    fi

    # Ensure parent directory exists for nvim folder
    mkdir -p "$(dirname "$dest")"

    # Create symlink
    ln -s "$src" "$dest"
    echo "Symlink created: $dest -> $src"
done

echo "All dotfiles linked successfully!"

