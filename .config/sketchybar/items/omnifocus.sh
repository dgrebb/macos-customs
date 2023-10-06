#!/usr/bin/env sh

sketchybar --add item omnifocus right \
  --set omnifocus \
  update_freq=180 \
  script="$PLUGIN_DIR/omnifocus.sh" \
  background.padding_left=3 \
  background.padding_right=15 \
  label.y_offset=-1 \
  icon.y_offset=1 \
  icon.font.size=18 \
  associated_display=1 \
  click_script="$PLUGIN_DIR/omnifocus_click.sh" \
  --subscribe omnifocus system_woke
