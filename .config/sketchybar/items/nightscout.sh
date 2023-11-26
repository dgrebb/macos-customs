#!/bin/bash

ICON=

nightscout=(
  drawing=on
  update_freq=60
  click_script="open https://glu.7ub3s.net/"
  script="$PLUGIN_DIR/nightscout.sh"
  background.padding_left=3
  background.padding_right=3
  icon="?"
  icon.color=$WHITE
  icon.padding_left=3
  icon.padding_right=3
  label.font="Hack Nerd Font:Regular:14.0"
  label.height=33
  label="$ICON"
  label.drawing=on
  label.color=$RED
  icon.width=33
  background.drawing=on
  # associated_display=1
)

sketchybar --add item nightscout right \
  --set nightscout "${nightscout[@]}"
