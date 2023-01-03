# file-sort

File-sort is a bash script that will sorts all items older than 14 days in a given folder into newly created archive directories.

- all directories will be moved to a single file
- all files will be moved into folders by extension

The format of the newly created archive directories is

```
dir/<extension>_archive_dd-mm-yyyy
```

#### Hot to use

Run the script with a path to the directory that you want to sort as a first argument.

```
./file_sort.sh <path_to_directory>
```
