#!/usr/bin/env bash

set -e

DATE_HUMAN="$(date +'%d-%m-%Y')"
DATE_FILE="$(date +'%m-%d')"

NOTES_DIR="$HOME/Documents/MySetup/Notes"
FILEPATH="$NOTES_DIR/note-$DATE_FILE.md"

mkdir -p "$NOTES_DIR"

if [[ ! -f "$FILEPATH" ]]; then
cat > "$FILEPATH" <<EOF
# Notes – $DATE_HUMAN

## Focus
- 

## Tasks
- [ ] 

## Notes
- 

## References
- 
EOF
fi

echo "$FILEPATH"
