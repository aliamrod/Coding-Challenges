# SED COMMANDS
# The stream editor (SED) command is widely used by Bash programmers to process and modify text. 
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

cd "$HOME"

if [[ "$num_files" -eq 0 ]]; then
  echo "No files present to change owner."
  exit 0
fi

local count=0
for file in *; do
  if [[-f "$file" ]]; then
    sed -i "s/$username/$reverse_username/" "$file"
    chown "$reverse_username" "$file"
    count=$((count+1)
  fi
  
  if [[ "$count" -eq "num_files" ]]; then
    break
  fi
done

echo "Changed owner for $count file(s)."
}

# Check if the numerical input 'n' is provided.
if [[$# -eq 1 ]]; then
  num_files="$1"
else
  num_files=0
fi

change_owner="$num_files"

# Script is saved as `change_owner.sh` and `chmod +x change_owner.sh` is called to make it an executable. It can be run without any arguments to change the owner of all files
# in the home directory. If one desires to change the owner of only a specific number of files, provide the numerical input 'n' as an argument.
./change_owner.sh # Change owner of all files in the home directory
./change_owner.sh 5 # Change owner of the first 5 files in the home directory
