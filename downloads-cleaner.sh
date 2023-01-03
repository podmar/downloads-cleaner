#!/usr/bin/env bash

# Sort and archive files in the downloads folder
# Author: podmar

# directory_to_clean="$1"
# cd "$directory_to_clean"

cd $HOME/Desktop/test_downloads

directory_name="dir_archive_$(date +"%d-%m-%Y")"
mkdir "$directory_name"

find . -maxdepth 1 -mindepth 1 -type d -mtime +30 |
xargs -I '{}' mv {} ./$directory_name

echo "$directory_name folder created and items older than 30 days archived"

# list all file extensions in the folder to a variable separated by spaces
extension_list=$(find . -maxdepth 1 -type f -name "[^.]*.*" | sed "s|.*\.||" | sort -u | tr "\n" " ")

# for each extension create a folder and move files older than 30 days inside
for extension in $extension_list; do
    dir_name=${extension}_archive_$(date +"%d-%m-%Y")
    mkdir "$dir_name"
    find . -maxdepth 1 -type f -name "*.$extension" -mtime +30 |
    xargs -I '{}' mv {} ./"$dir_name"
    echo "$extension files older than 30 days archived in $dir_name"
done