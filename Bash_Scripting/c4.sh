# SED COMMANDS
# The stream editor (SED) command is widely used by Bash programmers to process and modify test. 
# Write a Bash script that includes an SED command that takes the files in your home directory and changes their owner from your username to 
# the reverse of your username. So, for example, if your username is alia-mrod, then your Bash script should change the owner to dorm-aila.

# For an extra challenge, have your script accept a numerical input, 'n', that changes the owner of just the first 'n' files in your home directory.

username=$(whoami)
reverse_username=$(echo "$username" | rev)

# Function to change owner of files in home directory.
change_owner() {
  local num_files="$1"
  
  if [[! -d "$HOME" ]]; then
    echo "Home directory not found!"
    exit 1 
  fi
