#!/bin/bash
source $HOME/.config/yabai/displays.sh
source $HOME/.config/sketchybar/plugins/zenfuncs.sh

DESIRED_SPACES_PER_DISPLAY=3
CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

DISPLAY_1_UUID=$(yabai -m query --displays | jq -r '.[0].uuid')
if [[ "$DISPLAY_1_UUID" == "$HOME_MACBOOK_UUID" ]] || [[ "$DISPLAY_1_UUID" == "$WORK_MACBOOK_UUID" ]]; then
  echo "that's your laptop!"
  # Reconfigure music items
  sketchybar -m --set music.title drawing=off \
    --move music.artist drawing=off \
    --set music.album drawing=off \
    --set music drawing=off \
    --set network.up drawing=off \
    --set network.down drawing=off

  zen_on
  yabai -m config layout float
else
  # Reconfigure music items
  sketchybar -m --set music.title drawing=on \
    --set music.artist drawing=on \
    --set music.album drawing=on \
    --set music drawing=on

  zen_off
  yabai -m config layout bsp
fi

DELTA=0
while read -r line; do
  LAST_SPACE="$(echo "${line##* }")"
  LAST_SPACE=$(($LAST_SPACE + $DELTA))
  EXISTING_SPACE_COUNT="$(echo "$line" | wc -w)"
  MISSING_SPACES=$(($DESIRED_SPACES_PER_DISPLAY - $EXISTING_SPACE_COUNT))
  if [ "$MISSING_SPACES" -gt 0 ]; then
    for i in $(seq 1 $MISSING_SPACES); do
      yabai -m space --create "$LAST_SPACE"
      LAST_SPACE=$(($LAST_SPACE + 1))
    done
  elif [ "$MISSING_SPACES" -lt 0 ]; then
    for i in $(seq 1 $((-$MISSING_SPACES))); do
      yabai -m space --destroy "$LAST_SPACE"
      LAST_SPACE=$(($LAST_SPACE - 1))
    done
  fi
  DELTA=$(($DELTA + $MISSING_SPACES))
done <<<"$CURRENT_SPACES"

sketchybar --trigger space_change --trigger windows_on_spaces
