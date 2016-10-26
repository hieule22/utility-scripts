#!/bin/sh
# Shell script to remove temporary files from all subfolders and directories.
# Press d to delete junk files and any other key to skip.
# Copyright 2016 Hieu Le

# Regular expression of the file names to be deleted.
REGEX="*~"
# Key command to perform deletion.
DELETE="d"

junks=( $(find . -name $REGEX) )
echo "Found" ${#junks[@]} "file(s)."
echo "Press d to delete and anything else to skip!"

for file in ${junks[@]}
do
    read -n1 -r -s -p $file opt
    echo  # Begin on new line.
    if [ "$opt" == $DELETE ]; then
	echo "Deleting" $file
	rm $file
    else
	echo "Skipping" $file
    fi
done




