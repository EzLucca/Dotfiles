#!/usr/bin/env bash

set -e

NAME="$1"

if [[ -z "$NAME" ]]; then
  echo "No name provided" >&2
  exit 1
fi

DATE_UPDATE="$(date +'%Y-%m-%d-%H-%M')"

NOTES_DIR="$HOME/Documents/Notes"
mkdir -p "$NOTES_DIR"

SLUG=$(echo "$NAME" | tr '[:upper:]' '[:lower:]')
FILEPATH="$NOTES_DIR/$SLUG.md"

if [[ ! -f "$FILEPATH" ]]; then
cat > "$FILEPATH" <<EOF
last update: $DATE_UPDATE

# TITLE: $NAME

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
