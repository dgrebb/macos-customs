#!/bin/bash

# Setup or destroy spaces as needed to match 9
for _ in $(yabai -m query --spaces | jq '.[].index | select(. > 9)'); do
  yabai -m space --destroy 10
done

# Space Mapper
setup_space() {
  local idx="$1"
  local name="$2"
  local space=
  echo "setup space $idx : $name"

  space=$(yabai -m query --spaces --space "$idx")
  if [ -z "$space" ]; then
    yabai -m space --create
  fi

  yabai -m space "$idx" --label "$name"
}

# Set Up Spaces
setup_space 1 music
setup_space 2 web
setup_space 3 work
setup_space 4 code
setup_space 5 maincode
setup_space 6 project
setup_space 7 terminal
setup_space 8 office
setup_space 9 plan

main_display_padding=(
  top_padding 133
  bottom_padding 133
  left_padding 233
  right_padding 233
)

# Set space padding
yabai -m config --space 1 "${main_display_padding[@]}"
yabai -m config --space 2 "${main_display_padding[@]}"
yabai -m config --space 3 "${main_display_padding[@]}"

# Set floating spaces
yabai -m config --space 1 layout float
yabai -m config --space 3 layout float

# Assign apps to spaces
yabai -m rule --add app="^Music$" space=1
yabai -m rule --add app="^(Firefox|Obsidian)$" space=^2
yabai -m rule --add app="^(Notion|Photoshop|Lightroom|Pym)$" space=3
yabai -m rule --add app="^iTerm$" space=4
yabai -m rule --add app="^(OmniFocus|Mail|Calendar)$" space=5
yabai -m rule --add app="^Visual Studio Code$" space=8
yabai -m rule --add app="^dg project$" space=9
