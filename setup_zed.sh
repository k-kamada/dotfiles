#!/bin/bash

# Check if XDG_CONFIG_HOME is set, if not set it to default
if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

# Create nvim directory if it doesn't exist
mkdir -p "$XDG_CONFIG_HOME/.config/zed"

# Create symlink for init.lua
ln -sf "$HOME/dotfiles/zed/settings.json" "$XDG_CONFIG_HOME/zed/settings.json"
ln -sf "$HOME/dotfiles/zed/keymap.json" "$XDG_CONFIG_HOME/zed/keymap.json"

echo "Zed setup complete."
