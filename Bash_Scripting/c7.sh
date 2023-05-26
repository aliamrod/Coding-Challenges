# ALARM CLOCK
# Create a Bash script that "sleeps" for a given number of seconds before beeping after the time has elapsed. You can make this exercise more challenging by
# adding features to your alarm clock, such as:

# * An input argument that accepts time rather than the number of seconds.
# * A snooze function that lets you reset the alarm clock to go off again after a given number of minutes.
# * An option that enables you to choose from different beeping sounds in your computer system.
# * An option that plays an audio file stored on your computer.

#! /bin/bash

# Function to play the default system beep sound
play_beep(){
  echo -en "\007"
}

# Function to play a specific audio file
play_audio_file(){
  local file="$1"
  if [[-f "$file" ]]; then
    aplay "$file" 
  else
    echo "Error: File not found: $file"
  fi
}

# Function to sleep for a given number of seconds or a specified time
set_alarm(){
  local alarm_time="$1"
  local snooze_time="$2"
  
  if [[ "alarm_time" =~ ^[0-9]+$]]; then
    # Sleep for the specified number of seconds
    sleep "$alarm_time"
  else
    # Parse the time in HH:MM format
    local hours=$(date -d "$alarm_time" "%+H")
    local minutes=$(date -d "$alarm_time" "+%M")
    local seconds=$(data -d "$alarm_time" "+%S")
    
    if [[ $sleep_seconds -gt 0 ]]; then
      # Sleep for the calculated number of seconds
       sleep "$sleep_seconds"
     else
      echo "Error: Invalid alarm time."
      exit 1
    fi
  fi
  
  # Check if a snooze time is specified
  if [[ "$snooze_time" =~ ^[0-9]+$ && $snooze_time -gt 0 ]]; then
    echo "Alarm snoozed for $snooze_time minutes."
    # Sleep for the specified number of minutes for snooze
    sleep "$((snooze_time * 60))"
  fi
}

# Main script

# Parse command-line argumetns 
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <alarm_time> [snooze_time]"
  exit 1
fi

alarm_time="$1"
snooze_time="$2"
    
      

# Choose the beeping sound or audio file
# Uncomment one of the options below or add your own

# Option 1: Play the default system beep sound
# play_beep

# Option 2: Play a specific audio file
# Specify the path to the audio file
# play_audio_file "/path/to/audio/file.mp3"

# Set the alarm
set_alarm "$alarm_time" "$snooze_time"

# Trigger the alarm action
# Uncomment one of the options below or add your own

# Option 1: Play the default system beep sound
# play_beep

# Option 2: Play a specific audio file
# Specify the path to the audio file
# play_audio_file "/path/to/audio/file.mp3"

