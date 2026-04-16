#!/usr/bin/env bash

set -e

NOTES_DIR="$HOME/Documents/MySetup/Notes"
TAGS_DIR="$NOTES_DIR/tags"

mkdir -p "$NOTES_DIR" "$TAGS_DIR"

usage() {
	echo "Usage:"
	echo "  notes.sh \"Title\" [tag1 tag2 ...]"
	echo "  notes.sh --tags"
	exit 1
}

# --------------------------------------------------------------
# HELPERS
# --------------------------------------------------------------
normalize_tag() {
	echo "$1" \
		| tr '[:upper:]' '[:lower:]' \
		| sed 's/[^a-z0-9]/-/g'
}

format_tag_label() {
	# Capitalize first letter only
	echo "${1^}"
}

slugify() {
	echo "$1" \
		| tr '[:upper:]' '[:lower:]' \
		| sed 's/[^a-z0-9 ]//g; s/ \+/-/g'
}

# --------------------------------------------------------------
# CREATE NOTE
# --------------------------------------------------------------
create_note() {
	NAME="$1"
	shift

	if [[ -z "$NAME" ]]; then
		echo "No note title provided" >&2
		exit 1
	fi

	ID="$(date +'%Y%m%d%H%M')"
	DATE_UPDATE="$(date +'%Y-%m-%d-%H-%M')"
	SLUG=$(slugify "$NAME")

	FILE="$NOTES_DIR/$ID-$SLUG.md"

	if [[ -f "$FILE" ]]; then
		echo "Note already exists: $FILE"
		exit 0
	fi

	# Build tags line
	tags_line=""
	for t in "$@"; do
		tag_norm=$(normalize_tag "$t")
		tag_label=$(format_tag_label "$t")
		tags_line+="[#${tag_label}](tags/${tag_norm}.md) "
	done

	cat > "$FILE" <<EOF
id: $ID  
last update: $DATE_UPDATE  
tags: $tags_line

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

		# Extract tag labels from markdown links
		TAGS=$(grep "^tags:" "$file" \
			| sed -e 's/tags: //' \
			| tr ' ' '\n' \
			| sed -n 's/\[#\([a-zA-Z0-9_-]\+\)\](tags\/[a-zA-Z0-9_-]\+\.md)/\1/p')

		for tag in $TAGS; do
			tag_norm=$(normalize_tag "$tag")
			tag_label=$(format_tag_label "$tag")
			tagfile="$TAGS_DIR/$tag_norm.md"

			if [[ ! -f "$tagfile" ]]; then
				cat > "$tagfile" <<EOF
# $tag_label

## Notes
EOF
			fi

			# Avoid duplicates
			grep -q "\[$FILENAME\]" "$tagfile" || \
				echo "- [$FILENAME]($FILENAME)" >> "$tagfile"
		done
	done

	echo "Tag indexes updated."
}

# --------------------------------------------------------------
# COMMAND DISPATCH
# --------------------------------------------------------------
if [[ -z "$1" ]]; then
	usage
fi

if [[ "$1" == "--tags" ]]; then
	update_tags
	exit 0
fi

NOTE_TITLE="$1"
shift

create_note "$NOTE_TITLE" "$@"
update_tags
