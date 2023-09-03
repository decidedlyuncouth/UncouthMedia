#!/bin/bash

echo "Creating the TOC..."
echo "## Interface: 100002" > ../UncouthMedia.toc
echo "## Title: UncouthMedia" >> ../UncouthMedia.toc
echo "## Dependencies: SharedMedia" >> ../UncouthMedia.toc
echo "MyMedia.lua" >> ../UncouthMedia.toc
echo "Creating the file..."
echo 'local LSM = LibStub("LibSharedMedia-3.0")' > ../MyMedia.lua

#  echo "    BACKGROUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "-- BACKGROUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../background/*; do
  filename=$(basename "$F")
  title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
  echo "       $(basename "$F"), $title"
  echo 'LSM:Register("background", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/background/'$filename']])' >> ../MyMedia.lua
done

#  echo "    BORDER" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--  BORDER" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../border/*; do
  filename=$(basename "$F")
  title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
  echo "       $(basename "$F"), $title"
  echo 'LSM:Register("border", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/border/'$filename']])' >> ../MyMedia.lua
done

#  echo "    FONT" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   FONT" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../font/*.ttf; do
  filename=$(basename "$F")
  title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
  echo "       $(basename "$F"), $title"
  echo 'LSM:Register("font", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/font/'$filename']])' >> ../MyMedia.lua
done

#  echo "    SOUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   SOUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../sound/*; do
  filename=$(basename "$F")
  title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
  echo "       $(basename "$F"), $title"
  echo 'LSM:Register("sound", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/sound/'$filename']])' >> ../MyMedia.lua
done

#  echo "    STATUSBAR" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   STATUSBAR" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../statusbar/*; do
  filename=$(basename "$F")
  title=$(echo "$filename" | sed 's/\.[^.]*$//' | sed 's/_/ /g')
  echo "       $(basename "$F"), $title"
  echo 'LSM:Register("statusbar", "Uncouth: '$title'", [[Interface/Addons/UncouthMedia/statusbar/'$filename']])' >> ../MyMedia.lua
done

#read -p "Press Enter to continue..."
exit 0