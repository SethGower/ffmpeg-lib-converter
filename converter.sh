#!/bin/zsh
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

for arg in "$@"; do 
    cd $arg

    for file in **/*.avi; do
        echo -e "$COL_CYAN Converting: $COL_RESET" $file
        ffmpeg -i "$file" -c:v libx264 -c:a aac -metadata:s:a:0 language=eng -strict -2 "${file:0:-4}.mp4"
        rm "$file"
    done
    
    for file in **/*.mkv; do
        echo -e "$COL_CYAN Converting: $COL_RESET" $file
        ffmpeg -i "$file" -c:v copy -c:a aac -metadata:s:a:0 language=eng -strict -2 "${file:0:-4}.mp4"
        rm "$file"
    done
done
