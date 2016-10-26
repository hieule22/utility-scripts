#!/bin/sh
# Shell script to remove temporary files from all subfolders and directories.
# Press d to delete junk files and any other key to skip.
# Copyright 2016 Hieu Le

# Echo all command in debugging mode.
DEBUG=false
if [ $DEBUG = true ]; then
    set -x
fi

# DEFAULT PROGRAM OPTIONS.
# Regular expression of the file names to be deleted.
REGEX="*~"
# Root directory to scan.
DIRECTORY=.
# Other options.
OPTS=""

# PROGRAM CONSTANTS.
# Keyboard input to perform deletion.
DELETE="d"

# Parse command line arguments.
for ARG in "$@"
do
    case $ARG in
	-dir=*)
	    DIRECTORY="${ARG#*=}"
	    shift # Skip past argument=value.
	    ;;
	-regex=*)
	    REGEX="${ARG#*=}"
	    shift
	    ;;
	-norecursive) # Stop recursing into subdirectories.
	    OPTS+="-prune "
	    shift
	    ;;
	*)
	    # Unknown option.
	    echo "Unknown option: $ARG"
	;;
    esac
done

echo "Press $DELETE to delete and anything else to skip!"

JUNKS=( $(find $DIRECTORY -name $REGEX $OPTS) )
echo "Found" ${#JUNKS[@]} "file(s)."

for FILE in ${JUNKS[@]}
do
    read -n1 -r -s -p $FILE OPT
    echo  # Begin on new line.
    if [ "$OPT" == $DELETE ]; then
	echo "Deleting" $FILE
	rm $FILE
    else
	echo "Skipping" $FILE
    fi
done
