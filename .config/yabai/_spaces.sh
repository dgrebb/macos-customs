#!/bin/bash

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

  echo "setting up $idx space"

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

yabai -m config --space 1 "${main_display_padding[@]}"
yabai -m config --space 2 "${main_display_padding[@]}"
yabai -m config --space 3 "${main_display_padding[@]}"
