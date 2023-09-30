#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  BG_COLOR=$BACKGROUND_1
  COLOR=$BACKGROUND_2
  if [ "$SELECTED" = "true" ]; then
    BG_COLOR=$BACKGROUND_ACTIVE
    COLOR=$HIGHLIGHT_BORDER
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
    label.highlight=$SELECTED \
    background.border_color=$COLOR \
    background.color=$BG_COLOR
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
*)
  update
  ;;
esac
