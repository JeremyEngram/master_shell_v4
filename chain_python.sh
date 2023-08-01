#!/bin/bash

# Set the directory path
directory="/home/siebel/.bin"

# Loop through all the .py files in the directory
for file in "$directory"/*.py; do
    
    ls "$file"

    echo "Running $file"

    # Execute the Python script with python3
    python3 "$file"

    echo
done

