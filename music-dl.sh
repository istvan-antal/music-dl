#!/bin/bash
VIDEO_ID=$1
mkdir $VIDEO_ID
cd $VIDEO_ID
youtube-dl -x --write-description --audio-format mp3 "https://www.youtube.com/watch?v=$VIDEO_ID"
wget -O "$VIDEO_ID.jpg"  "http://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
MP3_FILE=$(find . -iname "*.mp3" -print)
DESCRIPTION_FILE=$(find . -iname "*.description" -print)
eyeD3 --add-image="$VIDEO_ID.jpg:OTHER" --add-lyrics="$DESCRIPTION_FILE" "$MP3_FILE"
rm "$DESCRIPTION_FILE"
rm "$VIDEO_ID.jpg"
mv "$MP3_FILE" ../
cd ..
rm -r "$VIDEO_ID"
