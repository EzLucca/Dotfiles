#!/bin/bash

# Prompt the user for the book title and author
echo "Enter the book title:"
read book_title

echo "Enter the author:"
read author

# Create a filename based on the book title (e.g., "Book_Title.txt")
filename="${book_title// /_}.md"

# Define the standard template
template="# Book Title: $book_title
# Author: $author
# Date: $(date +'%Y-%m-%d')

## Summary

## Key Points

## Quotes

## Reflections
"

# Write the template to the file
echo "$template" > "/home/duds/Dropbox/notes/src/$filename"

# Notify the user
echo "Note template created: $filename"

# Opening
nvim /home/duds/Dropbox/notes/src/$filename
