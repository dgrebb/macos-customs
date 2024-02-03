#!/bin/bash
DOT=$cwd/.dotfiles

# Link them
ln -sf $DOT/.aliases $HOME/.aliases
ln -sf $DOT/.functions $HOME/.functions
ln -sf $DOT/.gitconfig $HOME/.gitconfig
ln -sf $DOT/.p10k.zsh $HOME/.p10k.zsh
ln -sf $DOT/.zshrc $HOME/.zshrc

# Others while we're at it
ln -sf $cwd/.config/iTerm2 $HOME/.config/iTerm2
ln -sf $cwd/.config/iTerm2/Scripts $HOME/Library/Application\ Support/iTerm2/Scripts
ln -sf $cwd/.vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -sf $cwd/.vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -sf $cwd/.config/sketchybar $HOME/.config/sketchybar
ln -sf $cwd/.config/yabai $HOME/.config/yabai
ln -sf $cwd/.config/machine.sh $HOME/.config/machine.sh
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/

mkdir $HOME/.sketchyrw

echo "✓ Done linking dotfiles!"
echo "‼️ Remember to set up the ~/.machine and ~/.secrets files if needed."
