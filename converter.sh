#!/bin/bash
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

cd ../Scrubs/input
for file in *; do
    echo -e "$COL_CYAN Converting: $COL_RESET" $file
    if [[ ${file: -4} == ".mp4" ]]; then
        echo ffmpeg -i $file -c:v copy -c:a aac -metadata:s:a:0 language=eng "../output/$file"
        ffmpeg -i "$file" -c:v copy -c:a aac -metadata:s:a:0 language=eng -strict -2 "../output/$file"
    else 
        ffmpeg -i "$file" -c:v libx264 -c:a aac -metadata:s:a:0 language=eng -strict -2 "../output/${file:0:-4}.mp4"
    fi
    #rm "$file"
done
