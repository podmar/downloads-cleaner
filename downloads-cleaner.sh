#!/usr/bin/env bash
echo $BASH_VERSION
# always use a shebang with path to bash to indicate which interepreter should be used; bash will automatically open

# Sort and archive files in the downloads folder
# Author: podmar

directory="$HOME/Downloads"
cd "$directory"
mkdir $1
cd $1
pwd
# mkdir Archive