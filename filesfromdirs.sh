#!/bin/bash

#### Moves all of type "file" within subdirectory tree to base_directory

#type f is file, -t in cp is "target"
#multiple -exec commands can be used: find <generate list> -exec <command> {} \; -exec <command> {} \;
#does code need to be added to identify if item is symlink and copy target of symlink?

find "$base_directory" -type f -exec cp -t "$base_directory" {} +


#example if run in terminal:
find . -mindepth 2 -type f -print -exec mv {} . \;
