#!/bin/bash

ICON=󰟾

wallpaper=(
  drawing=on
  background.padding_left=3
  background.padding_right=3
  icon=$ICON
  icon.color=$RED
  icon.padding_left=3
  icon.padding_right=3
  label.drawing=off
  click_script="$PLUGIN_DIR/wallpaper.sh"
  # associated_display=1
)

sketchybar --add item wallpaper right \
  --set wallpaper "${wallpaper[@]}"
