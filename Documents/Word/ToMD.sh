#!/bin/bash
# Converts all .docx files in this folder to .md files in the parent folder using Pandoc

set -e

for file in ./*.docx; do
  [ -e "$file" ] || continue
  md_name="$(basename "${file%.docx}").md"
  md_path="../$md_name"
  pandoc "$file" -o "$md_path"
done
