#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=0
  icon.padding_left=0
  label.padding_right=5
  label.padding_left=0
  label.width=45
  label.align=right
  padding_left=0
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

calendar_bracket=(
  background.color=0x9c1c1c1c
  background.border_color=$BACKGROUND_2
)

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.weather" right \
  --set "iStat Menus Status,com.bjango.istatmenus.weather" \
  width=42 \
  background.padding_left=0 \
  background.padding_right=0 \
  background.drawing=off \
  background.shadow.drawing=off \
  icon.padding_right=0 \
  label.padding_right=0 \
  position=right \
  alias.scale=0.88 \
  click_script="$PLUGIN_DIR/zen.sh"

sketchybar --add alias "WorkingHours,Item-0" right \
  --set "WorkingHours,Item-0" "${alias[@]}" \
  alias.color=#RED \
  width=15 \
  label.padding_right=0 \
  icon.padding_right=0 \
  label.padding_left=0 \
  icon.padding_left=0 \
  alias.scale=0.3 \
  associated_display=1

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke

source "$ITEM_DIR/nightscout.sh"

sketchybar --add bracket calendarb "WorkingHours,Item-0" battery calendar "Glucose Graph,Item-0" "iStat Menus Status,com.bjango.istatmenus.weather" \
  --set calendarb "${calendar_bracket[@]}"
