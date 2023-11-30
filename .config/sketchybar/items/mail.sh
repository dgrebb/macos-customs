#!/usr/bin/env sh

sketchybar --add item mail right \
  --set mail \
  update_freq=180 \
  script="$PLUGIN_DIR/mail.sh" \
  background.padding_left=3 \
  background.padding_right=3 \
  label.y_offset=-1 \
  \
  icon.font.size=18 \
  associated_display=1 \
  click_script="$PLUGIN_DIR/mail_click.sh" \
  --subscribe mail system_woke # icon.y_offset=1 \
