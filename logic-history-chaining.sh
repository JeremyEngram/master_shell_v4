#!/bin/bash

# Get the last executed command from history
last_command=$(history 1 | awk '{print $2}')

# Search for previous instances of the command in history
previous_commands=$(history | grep "$last_command" | grep -v " $last_command$")

# Create the logical chain of commands
chain=""
while read -r line; do
    command=$(echo "$line" | awk '{print $2}')
    chain+=" && $command"
done <<< "$previous_commands"

# Print the logical chain of commands
echo "Logical chain of commands:"
echo "$chain"

