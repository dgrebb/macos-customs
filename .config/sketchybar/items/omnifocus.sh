#!/usr/bin/env sh

sketchybar --add item omnifocus right \
  --set omnifocus \
  update_freq=180 \
  script="$PLUGIN_DIR/omnifocus.sh" \
  background.padding_left=15 \
  background.padding_right=15 \
  icon.font.size=18 \
  associated_display=1 \
  --subscribe omnifocus system_woke
