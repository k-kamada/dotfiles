#!/bin/bash

# Check if XDG_CONFIG_HOME is set, if not set it to default
if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

# Create nvim directory if it doesn't exist
mkdir -p "$XDG_CONFIG_HOME/nvim"

# Create symlink for init.lua
ln -sf "$HOME/dotfiles/nvim/.config/nvim/init.lua" "$XDG_CONFIG_HOME/nvim/init.lua"

echo "Neovim setup complete."
