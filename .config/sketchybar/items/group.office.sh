#!/bin/bash

source "$HOME/.config/machine.sh"
source "$HOME/.config/yabai/_displays.sh"

if [[ "$MACHINE" == 'home' ]]; then
  if [[ "$main_display" == "$HOME_MACBOOK_UUID" ]]; then
    source "$ITEM_DIR/github.sh"
    source "$ITEM_DIR/ghmon.sh"
  else
    source "$ITEM_DIR/omnifocus.sh"
    source "$ITEM_DIR/mail.sh"
    source "$ITEM_DIR/github.sh"
    source "$ITEM_DIR/ghmon.sh"
  fi
else
  source "$ITEM_DIR/omnifocus.sh"
  source "$ITEM_DIR/rescuetime.sh"
  source "$ITEM_DIR/teams.sh"
fi

office_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket office ghmon.status github.bell mail omnifocus \
  --set office "${office_bracket[@]}"
