#!/bin/bash

# Define the destination directory
CONFIG_DIR="$HOME/.config/nvim"

# 1. Check if the directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Directory $CONFIG_DIR does not exist. Creating it now..."
    mkdir -p "$CONFIG_DIR"
fi

# 2. Check if the directory is empty
if [ "$(ls -A "$CONFIG_DIR")" ]; then
    echo "Directory $CONFIG_DIR is not empty. Clearing all its contents..."
    # Use 'rm -rf' to recursively remove all files and directories within
    # the target directory, but not the directory itself.
    rm -rf "$CONFIG_DIR"/*
fi

# 3. Copy files from the current directory
echo "Copying files from the current directory to $CONFIG_DIR..."
# 'cp -r' copies directories recursively.
# The '.*' part handles hidden files.
cp -r . "$CONFIG_DIR"

echo "Done!"
