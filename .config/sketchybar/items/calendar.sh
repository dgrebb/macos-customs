#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=10
  icon.padding_left=10
  label.padding_right=3
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

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.weather" right \
  --set "iStat Menus Status,com.bjango.istatmenus.weather" \
  background.padding_left=0 \
  background.padding_right=0 \
  background.drawing=off \
  background.shadow.drawing=off \
  width=60 \
  position=right \
  alias.scale=0.88

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke

sketchybar --add item calendar_spacer right \
  --set calendar_spacer background.drawing=off \
  width=5

sketchybar --add bracket calendarb "iStat Menus Status,com.bjango.istatmenus.weather" calendar \
  --set calendarb "${calendar_bracket[@]}"
