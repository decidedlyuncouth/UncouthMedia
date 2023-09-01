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
  echo "       $(basename "$F")"
  echo 'LSM:Register("background", "'$(basename "$F")'", [[Interface/Addons/UncouthMedia/background/'$(basename "$F")']])' >> ../MyMedia.lua
done

#  echo "    BORDER" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--  BORDER" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../border/*; do
  echo "       $(basename "$F")"
  echo 'LSM:Register("border", "'$(basename "$F")'", [[Interface/Addons/UncouthMedia/border/'$(basename "$F")']])' >> ../MyMedia.lua
done

#  echo "    FONT" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   FONT" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../font/*.ttf; do
  echo "       $(basename "$F")"
  echo 'LSM:Register("font", "'$(basename "$F")'", [[Interface/Addons/UncouthMedia/font/'$(basename "$F")']])' >> ../MyMedia.lua
done

#  echo "    SOUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   SOUND" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../sound/*; do
  echo "       $(basename "$F")"
  echo 'LSM:Register("sound", "'$(basename "$F")'", [[Interface/Addons/UncouthMedia/sound/'$(basename "$F")']])' >> ../MyMedia.lua
done

#  echo "    STATUSBAR" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
echo "--   STATUSBAR" >> ../MyMedia.lua
echo "-- -----" >> ../MyMedia.lua
for F in ../statusbar/*; do
  echo "       $(basename "$F")"
  echo 'LSM:Register("statusbar", "'$(basename "$F")'", [[Interface/Addons/UncouthMedia/statusbar/'$(basename "$F")']])' >> ../MyMedia.lua
done

#read -p "Press Enter to continue..."
exit 0