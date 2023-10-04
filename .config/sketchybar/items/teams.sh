#!/usr/bin/env sh

sketchybar --add item teams right \
  --set teams \
  update_freq=30 \
  script="$PLUGIN_DIR/teams.sh" \
  label.y_offset=-1 \
  icon.y_offset=1 \
  icon.font.size=18 \
  associated_display=1

sketchybar --subscribe teams system_woke
