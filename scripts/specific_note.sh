#!/usr/bin/env bash

set -e

NAME="$1"

if [[ -z "$NAME" ]]; then
  echo "No name provided" >&2
  exit 1
fi

DATE_HUMAN="$(date +'%d-%m-%Y')"
DATE_FILE="$(date +'%m-%d')"

NOTES_DIR="$HOME/Documents/Notes"
mkdir -p "$NOTES_DIR"

SLUG=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-')
FILEPATH="$NOTES_DIR/$SLUG$DATE_FILE.md"

if [[ ! -f "$FILEPATH" ]]; then
cat > "$FILEPATH" <<EOF
# $NAME – $DATE_HUMAN

## Project
- 

## Tasks
- [ ] 

## Bugs
- [ ] 

## Notes
- 
EOF
fi

echo "$FILEPATH"
