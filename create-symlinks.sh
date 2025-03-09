#!/bin/bash

# Define source and destination directories
DOTFILES_DIR="$HOME/Documents/dotFiles/mac"
CONFIG_DIR="$HOME/.config"

# Create .config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Create symlinks for config folders
echo "Creating symlinks for config folders..."
for folder in borders ghostty nvim sketchybar spicetify vifm; do
  if [ -d "$DOTFILES_DIR/$folder" ]; then
    # Remove existing destination if it exists
    if [ -e "$CONFIG_DIR/$folder" ]; then
      echo "Removing existing $CONFIG_DIR/$folder"
      rm -rf "$CONFIG_DIR/$folder"
    fi

    # Create symlink
    echo "Creating symlink: $CONFIG_DIR/$folder -> $DOTFILES_DIR/$folder"
    ln -sf "$DOTFILES_DIR/$folder" "$CONFIG_DIR/$folder"
  else
    echo "Warning: Source folder $DOTFILES_DIR/$folder does not exist"
  fi
done

# Create symlinks for home directory files
echo "Creating symlinks for home directory files..."
for file in .zshrc .tmux.conf; do
  if [ -f "$DOTFILES_DIR/$file" ]; then
    # Remove existing destination if it exists
    if [ -e "$HOME/$file" ]; then
      echo "Removing existing $HOME/$file"
      rm -f "$HOME/$file"
    fi

    # Create symlink
    echo "Creating symlink: $HOME/$file -> $DOTFILES_DIR/$file"
    ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
  else
    echo "Warning: Source file $DOTFILES_DIR/$file does not exist"
  fi
done

echo "Symlinks created successfully!"
