#!/bin/bash

utils_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  associated_display=1
)

# Set up machine-specific apps
utils=()

if [[ ! -z "$TEAMS" ]]; then
  utils+=teams
else
  echo "Skipping Teams util as it is not installed."
fi

sketchybar --add bracket utils volume_icon $utils omnifocus "Shifty,Item-0" "iStat Menus Status,com.bjango.istatmenus.memory" "iStat Menus Status,com.bjango.istatmenus.cpu" \
  --set utils "${utils_bracket[@]}" \
  associated_display=1
