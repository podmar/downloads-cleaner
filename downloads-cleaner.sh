#!/usr/bin/env bash

# Sort and archive files in the downloads folder
# Author: podmar

# direcotry_to_clean="$1"
# cd $directory_to_clean

cd $HOME/Desktop/test_downloads

directory_name="dir_archive_$(date +"%d-%m-%Y")"
mkdir "$directory_name"

find . -maxdepth 1 -mindepth 1 -type d -mtime +30 | xargs -I '{}' mv {} ./$directory_name

echo "$directory_name folder created and items older than 30 days archived"