#!/bin/bash

DOT_PATH=( "$HOME/.config/i3" "$HOME/scripts" "$HOME/.Xresources.d" )
HOME_FILES=( ".bashrc" ".conkyrc" ".conky.conf" ".conky_start" ".profile" ".Xresources" )
FILE_LIST=file_list.txt
EXCLUDE_PATTERN='\~|\#|keycodes|\.bak'

function gen_list() {
    # empty list file
    true > $FILE_LIST

    # list files in directory list
    for entry in ${DOT_PATH[@]}
    do
	find $entry -type f | grep -Ev "$EXCLUDE_PATTERN" >> $FILE_LIST
    done

    # list files in file list
    for file in ${HOME_FILES[@]}
    do
	echo "$HOME/$file" >> $FILE_LIST
    done
}

function cp_list() {
    for file in $(cat $FILE_LIST)
    do
	SRC_DIR=$(dirname $file)
	DEST=$PWD/$(echo $SRC_DIR | sed -E "s@($HOME)((/){0,1})@@g")
	cp -v $file $DEST
    done
}

gen_list
cp_list
