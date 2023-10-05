#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Microsoft Teams (work or school)")
ICON="󰊻"
LABEL="213"
ICON_COLOR="$WHITE"
DRAWING=on
WIDTH=0
PADDING=0
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
  LABEL="${BASH_REMATCH[1]}"
  echo "${BASH_REMATCH[2]} label is $LABEL"

  if [[ $LABEL == "" ]]; then
    ICON_COLOR="$WHITE"
    # DRAWING=off
  elif [[ $LABEL == "•" ]]; then
    ICON_COLOR=$RED
    # DRAWING=off
  elif [[ $LABEL =~ ^[0-9]+$ ]]; then
    ICON_COLOR="$BLUE"
    # DRAWING=on
    # WIDTH=10
    # PADDING=3
  else
    ICON_COLOR=$GREY
    # DRAWING=off
    # WIDTH=0
    # PADDING=0
    exit 0
  fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label="${LABEL}" icon.color="${ICON_COLOR}" drawing=$DRAWING \
  background.padding_left=500 \
  background.padding_right=3 \
  icon.padding_left=3 \
  icon.padding_right=0 \
  label.padding_left=3 \
  label.padding_right=3 \
  click_script="osascript -e 'tell application \"Microsoft Teams (work or school)\" to activate'" \
  width=45
