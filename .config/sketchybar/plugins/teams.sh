#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Microsoft Teams (work or school)")
ICON="󰊻"
DRAWING=on
WIDTH=0
PADDING=0
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
  LABEL="${BASH_REMATCH[1]}"

  if [[ $LABEL == "" ]]; then
    ICON_COLOR="$WHITE"
    # DRAWING=off
  elif [[ $LABEL == "•" ]]; then
    ICON_COLOR="0xffeed49f"
    # DRAWING=off
  elif [[ $LABEL =~ ^[0-9]+$ ]]; then
    ICON_COLOR="$BLUE"
    # DRAWING=on
    # WIDTH=10
    # PADDING=3
  else
    # DRAWING=off
    # WIDTH=0
    # PADDING=0
    exit 0
  fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color=${ICON_COLOR} drawing=$DRAWING \
  background.padding_left=500 \
  background.padding_right=3 \
  icon.padding_left=3 \
  icon.padding_right=0 \
  label.padding_left=0 \
  label.padding_right=3 \
  width=45
