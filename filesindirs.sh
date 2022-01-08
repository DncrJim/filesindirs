#!/bin/bash



cd "$base_directory"

#### Move files to subfolders (creates subfolder of same name as files and then moves files)


#creats for loop where x on each iteration is the next item in the directory to which we cd
for x in ./*
do
        #prints each item in directory as it loops
#       echo "$x"

        #prints each item in directory as it loops without file extension (directories are not printed)
        echo "${x%.*}"


        #tests to make sure x in this iteration is a file
        #uses ! -d instead of -f so that symlinks which resolve to a directory are also excluded
        if [ ! -d "$x" ]; then

                #make directory from file name (minus file extension) and then move file to that directory
                #-p flag means mkdir will not throw error if directory already exists (moving files w/ same name but different file extension)
                mkdir -p "${x%.*}" && mv "$x" "${x%.*}"
        fi
done


#### Moves all of type "file" within subdirectory tree to base_directory

#type f is file, -t in cp is "target"
#multiple -exec commands can be used: find <generate list> -exec <command> {} \; -exec <command> {} \;

find "$base_directory" -type f -exec cp -t "$base_directory" {} +
