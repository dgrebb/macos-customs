#!/bin/bash
DOT=$cwd./.dotfiles

# Link them
ln -s $DOT/.aliases $HOME/.aliases
ln -s $DOT/.functions $HOME/.functions
ln -s $DOT/.gitconfig $HOME/.gitconfig
ln -s $DOT/.zshrc $HOME/.zshrc

# Others while we're at it
ln -s $cwd./.vscode $HOME/.vscode
ln -s $cwd./.config/sketchybar $HOME/.config/sketchybar
ln -s $cwd./.config/yabai $HOME/.config/yabai
ln -s $cwd./.config/machine.sh $HOME/.config/machine.sh
ln -s $cwd./.config/iTerm2 $HOME/.config/iTerm2
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/
# ln -s $DOT/ $HOME/

mkdir $HOME/.sketchyrw

echo "✓ Done linking dotfiles!"
echo "‼️ Remember to set up the ~/.machine and ~/.secrets files if needed."
