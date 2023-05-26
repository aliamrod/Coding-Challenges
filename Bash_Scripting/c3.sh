# LISTING AND SORTING DIRECTORIES
# Create a Bash script that accepts directory paths as arguments. For each argument, list the contents of each directory with the name of each listed at the top.

# If you want to give yourself an added challenge, have your script accept an additional argument, "a" or "d", that sorts the contents of
# each directory in either ascending or descending order. For even more of a challenge, create a Bash script that sorts the contents of the directories
# based on an "a" or "d" argument that directly precedes it. In other words, you should be able to sort one directory in ascending order, 
# a second directory in descending order, and so on.

#! /bin/bash

# Function to list contents of directory
list_directory_contents() {
  local directory="$1" # variable declared as local will be visible only within this block of code in which it appears. // Local scope=> has meaning only within this function block
  local sort_order="$2"
  
  echo "Listing contents of directory: $directory"
  
  # Check if sort_order is 'a' or 'd' and set the sort command accordingly.
  if [["$sort_order" == "a" ]]; then
    sort_command="sort"
  elif [[ "$sort_order" == "d" ]]; then
    sort_command="sort -r"
  else
    sort_command="cat"
  fi
  
  # List the contents of the directory and sort them
  ls -1 "$directory" | $sort_command
  echo
 }
 
 # Loop through the arguments and list directory contents
 for (( i=1; i<=$#; i++ )); do
  arg="${!1}"
  
  # Check if the argument is 'a' or 'd' to determine the sort order.
  if [[ "$arg" == "a" || "$arg" == "d" ]]; then
    sort_order="$arg"
  else
    list_directory_contents "$arg" "$sort_order"
  fi
done

# To use the script, save it to `list_directories.sh`, and we make it executable (`chmod +x list_directories.sh`), and then run it with the directory paths as arguments. 
./list_directories.sh /path/to/directory1 a /path/to/directory2 d

# This will consequently list the contents of `directory1` in ascending order and the contents of `directory2` in descending order. If no sort order is specified, the script
# will default to listing the contents without sorting.
