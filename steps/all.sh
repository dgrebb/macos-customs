#!/bin/bash

echo "Running installation steps..."

# Install and configure xcode commandline tools
$cwd./steps/xcode.sh
# Install and configure homebrew
$cwd./steps/homebrew.sh
