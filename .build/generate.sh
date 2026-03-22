#!/bin/bash

INTERFACE_VERSION=$(cat ../wow-version.txt | tr -d '[:space:]')
echo "Creating the TOC..."
echo "## Interface: $INTERFACE_VERSION" > ../UncouthMedia.toc
echo "## Title: UncouthMedia" >> ../UncouthMedia.toc
echo "## Dependencies: SharedMedia" >> ../UncouthMedia.toc
echo "MyMedia.lua" >> ../UncouthMedia.toc
echo "Creating the file..."
echo 'local LSM = LibStub("LibSharedMedia-3.0")' > ../MyMedia.lua

echo "-- -----" >> ../MyMedia.lua
echo "-- BACKGROUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
if [ ! -f ../background/* ]; then
  echo "--       No background files found." >> ../MyMedia.lua
else
  for F in ../background/*; do
    filename=$(basename "$F")
    title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
    echo "       $(basename "$F"), $title"
    echo 'LSM:Register("background", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/background/'$filename']])' >> ../MyMedia.lua
  done
fi

echo "-- -----" >> ../MyMedia.lua
echo "--  BORDER" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
if [ ! -f ../border/* ]; then
  echo "--       No border files found." >> ../MyMedia.lua
else
  for F in ../border/*; do
    filename=$(basename "$F")
    title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
    echo "       $(basename "$F"), $title"
    echo 'LSM:Register("border", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/border/'$filename']])' >> ../MyMedia.lua
  done
fi

echo "-- -----" >> ../MyMedia.lua
echo "--   FONT" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
if [ ! -f ../font/* ]; then
  echo "--       No font files found." >> ../MyMedia.lua
else
  for F in ../font/*.ttf; do
    filename=$(basename "$F")
    title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
    echo "       $(basename "$F"), $title"
    echo 'LSM:Register("font", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/font/'$filename']])' >> ../MyMedia.lua
  done
fi

echo "-- -----" >> ../MyMedia.lua
echo "--   SOUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
# Find all sound files recursively, skipping directories and .gitkeep
SOUND_FILES=$(find ../sound -type f ! -name ".gitkeep" 2>/dev/null | sort)
if [ -z "$SOUND_FILES" ]; then
  echo "--       No sound files found." >> ../MyMedia.lua
else
  echo "$SOUND_FILES" | while read F; do
    # Get path relative to the addon root (e.g., sound/meme/Hello_Darkness.ogg)
    relpath=$(echo "$F" | sed 's|^\.\./||')
    filename=$(basename "$F")
    # Generate title: strip extension, split PascalCase and underscores into spaces
    title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g' | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g')
    # Build prefix: !!UNCMedia for top-level, !!UNCMediaSubfolder for subfolders
    subdir=$(echo "$relpath" | sed 's|^sound/||' | sed 's|/[^/]*$||')
    if [ "$subdir" = "$filename" ] || [ -z "$subdir" ]; then
      prefix="!!UNC"
    else
      # Capitalize first letter of each subfolder
      subfolder=$(echo "$subdir" | sed 's|/| |g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' | tr -d ' ')
      prefix="!!UNC${subfolder}"
    fi
    echo "       $relpath, $prefix $title"
    echo 'LSM:Register("sound", "'$prefix' '$title'", [[Interface/Addons/UncouthMedia/'$relpath']])' >> ../MyMedia.lua
  done
fi

echo "-- -----" >> ../MyMedia.lua
echo "--   STATUSBAR" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
if [ ! -f ../statusbar/* ]; then
  echo "--       No statusbar files found." >> ../MyMedia.lua
else
  for F in ../statusbar/*; do
    filename=$(basename "$F")
    title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
    echo "       $(basename "$F"), $title"
    echo 'LSM:Register("statusbar", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/statusbar/'$filename']])' >> ../MyMedia.lua
  done
fi

exit 0
