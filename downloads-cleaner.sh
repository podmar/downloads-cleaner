#!/usr/bin/env bash

# Sort and archive items in a selected folder
# Author: podmar

directory_to_clean="$1"
cd "$directory_to_clean" || exit

# move all folders older than 14 days to one archive directory
directory_name="dir_archive_$(date +"%d-%m-%Y")"
mkdir "$directory_name"

find . -maxdepth 1 -mindepth 1 -type d -mtime +14 |
xargs -I "{}" mv {} ./"$directory_name"

echo "All folders older than 14 days archived in $directory_name"

# list all file extensions in the folder to a variable separated by spaces
extension_list=$(find . -maxdepth 1 -type f -name "[^.]*.*" -mtime +14 | sed "s|.*\.||" | sort -u | tr "\n" " ")

# for each extension create a folder and move files older than 14 days inside
for extension in $extension_list; do
    dir_name=${extension}_archive_$(date +"%d-%m-%Y")
    mkdir "$dir_name"
    find . -maxdepth 1 -type f -name "*.$extension" -mtime +14 |
    xargs -I '{}' mv {} ./"$dir_name"
    echo "$extension files older than 14 days archived in $dir_name"
done