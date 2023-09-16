#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off
echo 'Homebrew installed!'

# Homebrew Bundle
brew bundle install
echo 'Homebrew bundle installed!'
