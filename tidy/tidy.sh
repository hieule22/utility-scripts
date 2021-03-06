#!/bin/sh
# Shell script to remove temporary files from all subfolders and directories.
# Press y to remove junk files and any other key to skip.
# Copyright 2016 Hieu Le

# Echo all command in debugging mode.
DEBUG=false
if [ $DEBUG = true ]; then
    set -x
fi

# DEFAULT PROGRAM OPTIONS.
# Regular expression of the file names to be removed.
REGEX="*~"
# Root directory to scan.
DIRECTORY=.
# Other options.
OPTS=""

# PROGRAM CONSTANTS.
# Keyboard input to perform removal.
export REMOVE="y"

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
	    OPTS+="-maxdepth 1"
	    shift
	    ;;
	*)
	    # Unknown option.
	    echo "Unknown option: $ARG"
	;;
    esac
done

echo "Press $REMOVE to remove and anything else to skip!"

# Since the UNIX 'find' command lists the matched paths on separate lines,
# the number of paths equals the number of lines output by the command.

list_files() {
    local DIRECTORY="$1"
    local REGEX="$2"
    local OPTS="$3"

    find $DIRECTORY -type f -name "$REGEX" $OPTS
}

rm_file() {
    local FILE="$1"
    read -n1 -r -s -p "Remove $FILE? " OPT
    echo  # Begin on new line.
    if [ "$OPT" == "$REMOVE" ]; then
	rm "$FILE"
	echo "$FILE was successfully removed!"
    else
	echo "Skipped" $FILE
    fi
}

export -f list_files
export -f rm_file

FILE_COUNT=( $(list_files "$DIRECTORY" "$REGEX" "$OPTS" | wc -l) )
echo "Found $FILE_COUNT file(s)."

# TODO(hieule): Remove duplicated code by using list_files()
find $DIRECTORY -type f -name "$REGEX" $OPTS -exec bash -c 'rm_file "$@"' bash {} \;

