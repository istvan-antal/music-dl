#!/bin/bash
VIDEO_ID=$1
mkdir $VIDEO_ID
cd $VIDEO_ID
youtube-dl -x --write-description --audio-format mp3 "https://www.youtube.com/watch?v=$VIDEO_ID"
wget -O "$VIDEO_ID.jpg"  "http://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
MP3_FILE=$(find . -iname "*.mp3" -print)
DESCRIPTION_FILE=$(find . -iname "*.description" -print)
#mv "$MP3_FILE" "$MP3_FILE-source"
#ffmpeg -i "$MP3_FILE-source" -i "$VIDEO_ID.jpg" -map_metadata 0 -map 0 -map 1 "$MP3_FILE"
eyeD3 --add-image="$VIDEO_ID.jpg:OTHER" --add-lyrics="$DESCRIPTION_FILE" "$MP3_FILE"
cd ..
