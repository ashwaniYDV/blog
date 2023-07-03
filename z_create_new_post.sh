#!/bin/sh

echo "Enter file name:"
read NAME

# Slugify the title
# slugified_title=$(echo "$NAME" | tr " " "-" | tr "," "-" | tr "." "-")
slugified_title=$(echo "$NAME" | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)

# Generate a random number
random_number=$((RANDOM % 1000000 + 1))

# Combine the slugified title and the random number
slug=$(echo "$slugified_title-$random_number.md")

# Print the slug
echo "$slug"

hugo new posts/$slug