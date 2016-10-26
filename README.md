# Utility Scripts

## About

This repository contains some of the scripts I wrote in Python and Bash to
facilitate my everyday programming.

## Content

* [tidy](https://github.com/hieule22/utility-scripts/tree/master/tidy):
Bash script to clean up regex-qualified junks from all subfolders and
directories.

* [weather](https://github.com/hieule22/utility-scripts/tree/master/weather):
Python program to query the current weather conditions.

## Installation

### Shell script

* Add a "shebang" on top of your script file (if previously missing):
`#!/bin/bash`
* Make your script executable: `chmod +x myscript.sh`
* Modify your path to add the directory where your script is located:
`export PATH=$PATH:/appropriate/directory`

### Python

* Add `#!/usr/bin/env python` on top of your script.
* Make your script executable: `chmod +x myprog.py`
* Execute with `./myprog.py`