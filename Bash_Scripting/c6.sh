# TPS REPORTS
# Using a Bash script, generate an email message that reminds the user to submit a TPS report by a certain day. Your script should accept a date or day
# as an input argument. For example, if the user inputs "Tuesday", then the output should look something like:

# "Please submit your TPS reports by EOD Tuesday. Your cooperation in this matter is much appreciated."

# For an extra challenge, have your script accept arguments for:
# * Name of recipient(s)
# * Due date for TPS reports
# * Motivational closing
# * Sender

# If any of the arguments are blank, the email should output a default word or phrase.

#! /bin/bash

# Set default values
recipient="Recipient"
due_data="EOD"
day="Tuesday"
closing="Your cooperation in this matter is much appreciated."
sender="Sender"

# Check if arguments are provided and assign custom values
if [ $# -eq 5 ]; then # if number of arguments is equal to 5...
  recipient="$1"
  due_date="$2"
  day="$3"
  closing="$4"
  sender="$5"
fi

# Generate the email message
echo "Dear $recipient,

This is a friendly reminder to submit your TPS report by $due_date $day. $closing

Best Regards,
$sender

# This script is saved as `tps_report.sh` and made executable. It is run by executing `./tps_report.sh`, and generates
# the email message with default values.

# To customize the email, you can provide the following arguments in the specified order:
# `<Recipient> <Due Date> <Day> <Closing> <Sender>`. For instance,
# `./tps_report.sh "John Doe" "Friday" "5:00 PM" "Your prompt action is vital." "Jane Smith"` will generate the email message
# with customized values.
