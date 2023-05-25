# LISTING AND SORTING DIRECTORIES
# Create a Bash script that accepts directory paths as arguments. For each argument, list the contents of each directory with the name of each listed at the top.

# If you want to give yourself an added challenge, have your script accept an additional argument, "a" or "d", that sorts the contents of
# each directory in either ascending or descending order. For even more of a challenge, create a Bash script that sorts the contents of the directories
# based on an "a" or "d" argument that directly precedes it. In other words, you should be able to sort one directory in ascending order, 
# a second directory in descending order, and so on.

#! /bin/bash

# Function to list contents of directory
  list_directory() {
    local dir="$1"
    local sort_order="$2"
    
    # Print directory name
    echo "Directory: $dir"
    
    # Sort the contents based on sort_order
    
