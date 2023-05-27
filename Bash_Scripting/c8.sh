# DETECT MOUNTED DISKS
# Programmers who work in Bash are often System Administrators who manage computer and server networks. So, it's important to known which disks and file systems 
# are mounted -- that is, accessible by the computer's file system. Note that just because a disk or computer is physically attached with cables doesn't always mean
# that it's mounted and accessible. Recall, a "mounted disk" is available to the operating system as a file system, for reading, writing, or both. 
# When mounting a disk, the operating system reads information about the file system from the disk's partition table, and assigns the disk a mount point.

# Come up with a Bash script that detects whether a given mount point or file system is mounted. If so, the script should return the amount of used space on the file system 
# and the amount of free space. If the file system isn't mounted, your script should return an error message.

# For an added challenge, add a prompt to your script that asks the user if they want to attempt to mount the file system if it's unmounted. 
# When the file system mounts, the script should then output the amount of used space and free space in the file system.


#! /bin/bash

# Function to check if a file system is mounted
check_mount(){
  mountpoint="$1"
  mount_status=$(findmnt -M "$mountpoint" -o TARGET -n) # `findmnt` is a command-line utility in Linux that is used to find and display information about mounted file systems.
  
  if [ -z "$mount_status" ]; then
    echo "File system is not mounted."
    read -p "Do you want to attempt to mount it? [Y/N]: " answer
    
    case $answer in 
      [Yy]* )
        mount "$mountpoint"
        check_mount "$mountpoint" 
        ;;
      [Nn]* ) exit ;;
      * ) echo "Invalid choice. Exiting." && exit ;;
    esac
  else
    echo "File system is mounted at: $mount_status"
    df -h "$mount_status"
  fi
}

# Main script
read -p "Enter the mount point or file system path: " path
 
check_mount "$path"
