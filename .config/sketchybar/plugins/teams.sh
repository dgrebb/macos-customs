#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Microsoft Teams (work or school)")
ICON="󰊻"
DRAWING=off
WIDTH=0
PADDING=0
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
  LABEL="${BASH_REMATCH[1]}"

  if [[ $LABEL == "" ]]; then
    ICON_COLOR="$WHITE"
    DRAWING=off
  elif [[ $LABEL == "•" ]]; then
    ICON_COLOR="0xffeed49f"
    DRAWING=off
  elif [[ $LABEL =~ ^[0-9]+$ ]]; then
    ICON_COLOR="$BLUE"
    DRAWING=on
  else
    DRAWING=off
    WIDTH=0
    PADDING=0
    exit 0
  fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color=${ICON_COLOR} drawing=$DRAWING \
  background.padding_left=$PADDING \
  background.padding_right=$PADDING \
  background.width=$WIDTH \
  width=$WIDTH icon.width=$WIDTH label.width=$WIDTH
