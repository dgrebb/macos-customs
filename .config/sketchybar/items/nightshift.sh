#!/bin/bash
source "$CONFIG_DIR/colors.sh"

# Requires nightlight: https://github.com/smudge/nightlight

nightshift=(
  color=$WHITE
  background.padding_left=0
  background.padding_right=0
  associated_display=1
)

sketchybar --add item nightshift right \
  --set nightshift \
  icon=󰖨 \
  color=$WHITE \
  width=15 \
  click_script="nightlight toggle" \
  associated_display=1
