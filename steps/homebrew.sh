#!/bin/bash

# Install Homebrew
echo "Installing Homebrew..."
NONINTERACTIVE=1 bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/opt/homebrew/bin:$PATH"
brew analytics off
echo "✓ Homebrew installed!"

# Homebrew Bundle
echo "Installing bundle from Brewfile"
brew bundle --file="$cwd/Brewfile"
echo "✓ Homebrew bundle installed!"
