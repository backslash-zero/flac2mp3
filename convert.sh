#!/bin/bash

echo "args: " $#;

if [[ $# -ne 1 ]] ;
then
	echo "No arguments supplied."
	echo "Usage: $./convert.sh directory/to/files/"
	exit 1
fi

cd $1;

# Main Loop
find . -name "*.flac" -exec 
	ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;

exit 0;