# CREATING COMMANDS
# While Bash comes with plenty of useful built-in commands, a key skill every Bash programmer should know is how to generate their own.
# Write a command that lists the contents of your /usr/local directoory. Your script can set up variables, but you're not 
# allowed to call any commands within the script directory.


#! /bin/bash
# Check if an argument is provided
if [-n "$1" ]; then
  directory="$1"
else
  directory="/usr/local"
fi

# Check if the directory exists
if [-d "$directory" ]; then
  #Loop thorugh each item in the directory
  for item in "$directory"/*; do
    # Check if the item is a file
    if [-f "$item" ]; then
      echo "$item"
    fi
  done
else
  echo "Directory does not exist: $directory"
fi

# We then save the script file, such as `list_directory.sh`, and make it executable using the command `chmod +x list_directory.sh`.
# The script can be run by providing an optional argument specifying the directory you want to list. If no argument is provided, it will 
# default to listing the contents of the `usr/local` directory.

# For instanace, to list the contents of the `usr/local` directory, run the script without any arguments.
.list_directory.sh

# To list the contents of a directory directory, provide the directory path as an argument:
./list_directory.sh /path/to/directory

# The script will output the contents of the specified directory, showing each item in a single column.
