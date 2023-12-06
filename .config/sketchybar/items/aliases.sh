#!/bin/bash

# Find aliases by running
# sketchybar --query default_menu_items

alias=(
  background.padding_left=0
  background.padding_right=0
  associated_display=1
)

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.cpu" right \
  --set "iStat Menus Status,com.bjango.istatmenus.cpu" "${alias[@]}" \
  alias.color=#RED \
  width=10 \
  label.padding_right=0 \
  icon.padding_right=0 \
  alias.scale=0.8 \
  associated_display=1

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.memory" right \
  --set "iStat Menus Status,com.bjango.istatmenus.memory" "${alias[@]}" \
  alias.color=yellow \
  width=18 \
  alias.scale=0.8 \
  associated_display=1

sketchybar --add alias "SystemUIServer,TimeMachine.TMMenuExtraHost" right \
  --set "SystemUIServer,TimeMachine.TMMenuExtraHost" "${alias[@]}" \
  width=30 \
  label.padding_right=0 \
  icon.padding_right=0 \
  alias.scale=0.8 \
  associated_display=1

# sketchybar --add item spacer1 right \
#   --set spacer1 background.drawing=off \
#   associated_display=1 \
#   width=9
