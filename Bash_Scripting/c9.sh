# RECURSION COUNTDOWN
# Recursion is when a function calls itself to perform the same task until some condition is met. This is most commonly done in Bash with loops.

# Create a countdown generator in Bash that accepts a positive integer as input. The output should show numbers decreasing, starting with the input number until 0.
# After displaying 0, the output should also display "Blast off!". 

# Looking for something a little more challenging, try creating a Bash function that accepts any number of arguments. The output should print out
# each argument on a new line. Your Bash script should use the echo command only once.

#! /bin/bash

countdown() {
  local number=$1
  
  if ((number >= 0 )); then
    echo "$number"
    countdown "$((number - 1))"
  
  if ((number >= 0 )); then
    echo "$number"
    countdown "$((number - 1))"
  else
    echo "Blast off!"
  fi
}

# Check if an argument is provided 
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <number>"
  exit 1
fi

# Call the countdown function with the provided number
countdown "$1"

## To add to the script...
print_arguments() {
  local IFS=$'\n'
  echo "$*"
}
