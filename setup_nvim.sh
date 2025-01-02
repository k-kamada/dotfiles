#!/bin/bash

# Check if XDG_CONFIG_HOME is set, if not set it to default
if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define source and destination directories
SOURCE_DIR="$SCRIPT_DIR/nvim"
DEST_DIR="$XDG_CONFIG_HOME/nvim"

# Function to clean up the destination directory
cleanup_dest_dir() {
  local dest="$1"

  # Iterate over all items in the destination directory
  find "$dest" -mindepth 1 -maxdepth 1 -print0 | while IFS= read -r -d $'\0' item; do
    # Check if the item is a symlink, directory, or file and remove it
    if [ -L "$item" ] || [ -f "$item" ] || [ -d "$item" ]; then
      rm -rf "$item"
    fi
  done
}

# Function to create symlinks recursively
# Parameters:
#   $1: Source directory
#   $2: Destination directory
#   $3: Relative path (used for recursion)
create_symlinks() {
  local source="$1"
  local dest="$2"
  local relative_path="${3:-.}"

  # Iterate over files and directories in the source directory
  find "$source/$relative_path" -mindepth 1 -maxdepth 1 -print0 | while IFS= read -r -d $'\0' item; do
    local item_relative_path="${item#$source/}"
    local item_dest="$dest/$item_relative_path"

    # If destination exists, remove it (could be a file, dir, or symlink)
    if [ -e "$item_dest" ]; then
      rm -rf "$item_dest"
    fi

    # Create symbolic link
    ln -s "$item" "$item_dest"
  done
}

echo "Neovim setup started."
echo "SOURCE_DIR: $SOURCE_DIR"
echo "DEST_DIR: $DEST_DIR"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Clean up the destination directory
cleanup_dest_dir "$DEST_DIR"

# Create symlinks for the entire directory structure
create_symlinks "$SOURCE_DIR" "$DEST_DIR"

echo "Neovim setup complete."
