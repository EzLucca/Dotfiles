#!/usr/bin/env bash

set -e

NOTES_DIR="$HOME/Documents/Notes"
TAGS_DIR="$NOTES_DIR/tags"

mkdir -p "$NOTES_DIR" "$TAGS_DIR"

usage() {
	echo "Usage:"
	echo "  notes.sh new \"Title\" [tag1 tag2 ...]"
	echo "  notes.sh tags"
	exit 1
}

# --------------------------------------------------------------
# CREATE NOTE
# --------------------------------------------------------------
create_note() {
	NAME="$1"
	shift
	TAGS="$*"

	if [[ -z "$NAME" ]]; then
		echo "No note title provided" >&2
		exit 1
	fi

	ID="$(date +'%Y%m%d%H%M')"
	DATE_UPDATE="$(date +'%Y-%m-%d-%H-%M')"

	SLUG=$(echo "$NAME" \
		| tr '[:upper:]' '[:lower:]' \
		| sed 's/[^a-z0-9 ]//g; s/ \+/-/g')

	FILE="$NOTES_DIR/$ID-$SLUG.md"

	[[ -f "$FILE" ]] && {
		echo "Note already exists: $FILE"
			exit 0
		}

cat > "$FILE" <<EOF
id: $ID  
last update: $DATE_UPDATE  
tags: $(for t in $TAGS; do printf "[#%s](tags/%s.md) " "$t" "$t"; done)

# TITLE: $NAME

EOF

echo "Created: $FILE"
}

# --------------------------------------------------------------
# UPDATE TAG INDEX
# --------------------------------------------------------------
update_tags() {
    mkdir -p "$TAGS_DIR"
    rm -f "$TAGS_DIR"/*.md

    for file in "$NOTES_DIR"/*.md; do
        [[ ! -f "$file" ]] && continue

        ID=$(grep "^id:" "$file" | awk '{print $2}')
        FILENAME=$(basename "$file")

        # Strictly extract only valid tags
        TAGS=$(grep -A 50 "^[[:space:]]*tags:" "$file" | grep "^[[:space:]]*-" | \
        sed -En 's/^[[:space:]]*- \[#([a-zA-Z0-9_-]+)\]\(tags\/[a-zA-Z0-9_-]+\.md\)/\1/p')

        for tag in $TAGS; do
            tagfile="$TAGS_DIR/$tag.md"

            if [[ ! -f "$tagfile" ]]; then
                cat > "$tagfile" <<EOF
# ${tag^}

## Notes
EOF
            fi

            grep -q "\[$ID\]" "$tagfile" || \
                echo "- [$ID]($FILENAME)" >> "$tagfile"
        done
    done

    echo "Tag indexes updated."
}

# --------------------------------------------------
# COMMAND DISPATCH
# --------------------------------------------------
if [[ -z "$1" ]]; then
    echo "Usage: bash notes.sh \"Note Title\" [tag1 tag2 ...]"
    exit 1
fi

if [[ "$1" == "--tags" ]]; then
    # Only update tags, no new note
    update_tags
    exit 0
fi

# First argument is always the note title
NOTE_TITLE="$1"
shift
NOTE_TAGS="$@"

# Create note
create_note "$NOTE_TITLE" $NOTE_TAGS

# Automatically update tags after creating a note
update_tags

