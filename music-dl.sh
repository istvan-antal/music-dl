#!/bin/bash
VIDEO_ID=$1
mkdir $VIDEO_ID
cd $VIDEO_ID
youtube-dl -x --write-description --audio-format mp3 "https://www.youtube.com/watch?v=$VIDEO_ID"
wget -O "$VIDEO_ID.jpg"  "http://img.youtube.com/vi/$VIDEO_ID/maxresdefault.jpg"
cd ..
