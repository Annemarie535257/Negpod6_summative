#!/bin/bash

# Source directory path
source_dir="/root/Negpod6_summative/Question1"

# Destination directory path
destination_dir="/root/Negpod6_summative/negpod_6-q1"

# Move files from source to destination
mv "$source_dir"/* "$destination_dir"/

# Check if the move operation was successful
if [ $? -eq 0 ]; then
    echo "Files moved successfully."
else
    echo "Failed to move files."
fi
