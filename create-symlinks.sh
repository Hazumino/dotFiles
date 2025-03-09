#!/bin/bash

# Detect operating system and set the source directory accordingly
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS_DIR="linux"
  echo "Linux detected, using linux configuration."
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS_DIR="mac"
  echo "macOS detected, using mac configuration."
else
  echo "Unknown operating system. Defaulting to mac configuration."
  OS_DIR="mac"
fi

# Define source and destination directories
DOTFILES_DIR="$HOME/Documents/dotfiles/$OS_DIR"
CONFIG_DIR="$HOME/.config"

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Error: Dotfiles directory $DOTFILES_DIR does not exist."
  exit 1
fi

# Create symlinks for config folders
echo "Creating symlinks for config folders..."

# Loop through all directories in the dotfiles directory
for folder in $(find "$DOTFILES_DIR" -maxdepth 1 -type d -not -path "$DOTFILES_DIR"); do
  folder_name=$(basename "$folder")

  # Skip hidden directories (those starting with .)
  if [[ "$folder_name" != .* ]]; then
    # Remove existing destination if it exists
    if [ -e "$CONFIG_DIR/$folder_name" ]; then
      echo "Removing existing $CONFIG_DIR/$folder_name"
      rm -rf "$CONFIG_DIR/$folder_name"
    fi

    # Create symlink
    echo "Creating symlink: $CONFIG_DIR/$folder_name -> $folder"
    ln -sf "$folder" "$CONFIG_DIR/$folder_name"
  fi
done

# Create symlinks for home directory files (dotfiles)
echo "Creating symlinks for home directory files..."

# Loop through all hidden files in the dotfiles directory
for file in $(find "$DOTFILES_DIR" -maxdepth 1 -type f -name ".*"); do
  file_name=$(basename "$file")

  # Remove existing destination if it exists
  if [ -e "$HOME/$file_name" ]; then
    echo "Removing existing $HOME/$file_name"
    rm -f "$HOME/$file_name"
  fi

  # Create symlink
  echo "Creating symlink: $HOME/$file_name -> $file"
  ln -sf "$file" "$HOME/$file_name"
done

echo "Symlinks created successfully!"
