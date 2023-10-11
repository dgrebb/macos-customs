#!/bin/bash
source "$HOME/.config/machine.sh"

utils_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  associated_display=1
)

# Set up machine-specific apps
utils=()

if [[ "$MACHINE" == 'work' ]]; then
  utils+=teams
else
  utils+=mail
fi

sketchybar --add bracket utils volume_icon $utils omnifocus nightshift "iStat Menus Status,com.bjango.istatmenus.cpu" \
  "iStat Menus Status,com.bjango.istatmenus.memory" \
  ip_address network.up network.down \
  --set utils "${utils_bracket[@]}" \
  associated_display=1
