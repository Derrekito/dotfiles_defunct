#!/bin/bash

# This script generates a list of specified configuration and script files from the user's home directory
# and copies them to the current working directory. It filters out files matching certain patterns and
# ensures only relevant files are copied.

# Array of directories to search for files
DOT_PATH=( "$HOME/.config/i3" "$HOME/scripts" "$HOME/.Xresources.d" )

# Array of specific files in the home directory to include
HOME_FILES=( ".bashrc" ".conkyrc" ".conky.conf" ".conky_start" ".profile" ".Xresources" )

# File to store the list of files to be copied
FILE_LIST=file_list.txt

# Pattern to exclude certain files (temporary and backup files)
EXCLUDE_PATTERN='\~|\#|keycodes|\.bak'

# Function to generate a list of files to be copied
function gen_list() {
    # Clear the contents of the file list
    true > $FILE_LIST

    # Iterate over directories in DOT_PATH and list files, excluding those matching EXCLUDE_PATTERN
    for entry in ${DOT_PATH[@]}
    do
        find $entry -type f | grep -Ev "$EXCLUDE_PATTERN" >> $FILE_LIST
    done

    # Add specific files from HOME_FILES to the list
    for file in ${HOME_FILES[@]}
    do
        echo "$HOME/$file" >> $FILE_LIST
    done
}

# Function to copy the files listed in FILE_LIST to the current directory
function cp_list() {
    # Read each file from FILE_LIST and copy it to the current directory
    for file in $(cat $FILE_LIST)
    do
        # Determine the source directory
        SRC_DIR=$(dirname $file)

        # Create the destination path, excluding the home directory part
        DEST=$PWD/$(echo $SRC_DIR | sed -E "s@($HOME)((/){0,1})@@g")

        # Copy the file to the destination
        cp -v $file $DEST
    done
}

# Generate the list of files and then copy them
gen_list
cp_list
