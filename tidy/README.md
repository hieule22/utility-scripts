# tidy

## About

`tidy` allows users to efficiently delete files whose names match a specified
regular expression by recursively exploring a start directory for all match
instances. A list of files will then be displayed, each of which users can
prompt for deletion by pressing `d`. Scanning can be terminated at any time
by pressing `Ctrl + C`.

## Installation

Refer to repository
[README](https://github.com/hieule22/utility-scripts/blob/master/README.md)
for details on how to install and execute this script.

## Options

`-regex=$REGEXPR` specifies the regular expression for wanted filenames.
If unspecified, only temporary files - those ending with `~` - will be
examined.

`-dir=$DIRECTORY` specifies the start path to initiate the search. If unspecified,
the start path will default to the current working directory.

`-norecursive` prevents the search from being recursive - only files at the
topmost level of this directory tree will be examined. If unspecified, the search
will be recursive - files from all subdirectories will be examined.

## Examples

Remove temporary files from all subdirectories of the current working directory.

```bash
tidy
```

Remove files ending with `.txt` from all subdirectories of a directory `foo`.

```bash
tidy  -regex=*.txt -dir=path/to/foo/
```

Remove files ending with `.txt` from the topmost level of a directory `foo`.

```bash
tidy -regex=*.txt -dir=path/to/foo/ -norecursive
```