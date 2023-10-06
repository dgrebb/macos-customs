#!/usr/bin/env sh

sketchybar --add item teams right \
  --set teams \
  update_freq=30 \
  script="$PLUGIN_DIR/teams.sh" \
  label.y_offset=-1 \
  icon.y_offset=1 \
  icon.font.size=18 \
  icon.padding_left=3 \
  icon.padding_right=0 \
  label.padding_left=3 \
  label.padding_right=3 \
  click_script="$PLUGIN_DIR/teams_click.sh" \
  width=45
  associated_display=1

sketchybar --subscribe teams system_woke
