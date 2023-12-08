#!/bin/bash

source "$HOME/.config/machine.sh"
source "$HOME/.config/yabai/_displays.sh"

office_items=()

office_spacer=(
  background.drawing=off
  associated_display=1
  width=0
  icon.padding_left=0
  icon.padding_right=0
  label.padding_left=0
  label.padding_right=0
)

sketchybar --add item spacer1 right \
  --set spacer1 "${office_spacer[@]}"

if [[ "$MACHINE" == 'home' ]]; then
  if [[ "$main_display" == "$HOME_MACBOOK_UUID" ]]; then
    source "$ITEM_DIR/github.sh"
    source "$ITEM_DIR/ghmon.sh"
    office_items+="github ghmon"
  else
    source "$ITEM_DIR/omnifocus.sh"
    source "$ITEM_DIR/mail.sh"
    source "$ITEM_DIR/github.sh"
    source "$ITEM_DIR/ghmon.sh"
    office_items+="omnifocus mail github ghmon"
  fi
else
  source "$ITEM_DIR/github.sh"
  source "$ITEM_DIR/omnifocus.sh"
  source "$ITEM_DIR/teams.sh"
  source "$ITEM_DIR/rescuetime.sh"
  office_items+="rescuetime teams omnifocus github"
fi

office_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add item spacer20 right \
  --set spacer20 "${office_spacer[@]}"

sketchybar --add bracket office spacer1 $office_items spacer20 \
  --set office "${office_bracket[@]}"
