# "PICK YOUR FAVORITE"
# Think of three things you like and create a Bash script that prompts the user to respond based on these things.
# It could be something like "Which would you choose..."

# Using case statements, have the script output different responses based on the chosen selection. For example, 
# if cake is a choice and someone picks cake, a sample output response could be "Great choice. Enjoy your cake!"

# To make things a bit more challenging, add an appropriate response message if someone picks something that isn't on the list.
# For example, "Sorry, but that's not on the list. Pick X, Y, or Z, please."

# You can also have your Bash script prompt for more information about the chosen thing. For instance, if someone picks cake, another prompt
# can ask "What kind of cake?" and that prompt could be followed by a final response based on this input, such as, "Great choice.
# Enjoy your cake!"

#! /bin/bash

# Prompt the user to choose from three options.
echo "Choose one of the following:"
echo "1. Cake"
echo "2. Pizza"
echo "3. Ice cream"
read -p "Enter your choice (1-3): " choice

# Process gthe user's choice using a case statement.
case $choice in
  1)
    # Prompt for the kind of cake
    read -p "What kind of cake? " cake_choice
    echo "Great choice. Enjoy your $cake_choice cake!"
    ;;
  2)
    echo "Pizza is always a good choice. Enjoy!"
    ;;
  3)
    echo "Ice cream is a fantastic treat. Enjoy!"
    ;;
  *)
    echo "Sorry, but that's not on the list. Pick another option."
    ;;
esac
