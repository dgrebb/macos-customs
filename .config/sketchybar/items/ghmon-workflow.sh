#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

github_status=(
  padding_right=6
  update_freq=15
  icon=⏺
  icon.font="Hack Nerd Font:Regular:14.0"
  icon.color=$BLUE
  label=$LOADING
  label.highlight_color=$BLUE
  popup.align=right
  script="$PLUGIN_DIR/ghmon-workflow.sh"
  # click_script="$POPUP_CLICK_SCRIPT"
  associated_display=1
)

github_template=(
  drawing=off
  background.corner_radius=12
  padding_left=7
  padding_right=7
  icon.background.height=2
  icon.background.y_offset=-12
)

sketchybar --add item github.status right \
  --set github.status "${github_status[@]}"
  # --subscribe github.status mouse.entered \
  # mouse.exited \
  # mouse.exited.global \
  # \
  # --add item github.template popup.github.status \
  # --set github.template "${github_template[@]}"
