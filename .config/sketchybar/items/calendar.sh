#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=20
  icon.padding_left=20
  label.padding_right=20
  label.width=45
  label.align=right
  padding_left=5
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

calendar_bracket=(
  background.color=0x9c1c1c1c
  background.border_color=$BACKGROUND_2
)

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke

sketchybar --add bracket calendarb calendar \
  --set calendarb "${calendar_bracket[@]}"

sketchybar --add item calendar_spacer right \
  --set calendar_spacer background.drawing=off \
  width=5
