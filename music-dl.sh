#!/bin/bash
VIDEO_ID=$1
mkdir $VIDEO_ID
cd $VIDEO_ID
youtube-dl -x --add-metadata --embed-thumbnail --write-info-json --write-description --audio-format mp3 "https://www.youtube.com/watch?v=$VIDEO_ID"
#wget -O "$VIDEO_ID.jpg"  "http://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
MP3_FILE=$(find . -iname "*.mp3" -print)
DESCRIPTION_FILE=$(find . -iname "*.description" -print)
JSON_FILE=$(find . -iname "*.json" -print)
UPLOADER=$(cat "$JSON_FILE" |  python -c "import json,sys;obj=json.load(sys.stdin);print obj['uploader'];")
eyeD3 --artist="$UPLOADER" --add-lyrics="$DESCRIPTION_FILE" "$MP3_FILE"
rm "$DESCRIPTION_FILE"
rm "$JSON_FILE"
mv "$MP3_FILE" ../
cd ..
rm -r "$VIDEO_ID"
