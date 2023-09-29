#!/bin/bash

switchdesktop() {
  typeset -A desktophash
  desktophash[0]=29
  desktophash[1]=18
  desktophash[2]=19
  desktophash[3]=20
  desktophash[4]=21
  desktophash[5]=23
  desktophash[6]=22
  desktophash[7]=26
  desktophash[8]=28
  desktophash[9]=25
  desktopkey=${desktophash[$1]}
  osascript -e "tell application \"System Events\" to key code $desktopkey using control down"
}

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$BACKGROUND_2
  if [ "$SELECTED" = "true" ]; then
    COLOR=$HIGHLIGHT_BORDER
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
    label.highlight=$SELECTED \
    background.border_color=$COLOR
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null || switchdesktop $SID
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
