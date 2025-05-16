#!/bin/bash
# Converts all Markdown documents in this directory to Word (.docx) format in the Word subfolder using Pandoc

set -e

for file in ./*.md; do
  [ -e "$file" ] || continue
  word_name="$(basename "${file%.md}").docx"
  word_path="./Word/$word_name"
  pandoc "$file" -o "$word_path"
done
