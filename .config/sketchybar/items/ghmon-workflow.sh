#!/bin/bash

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

github_status=(
  padding_right=6
  padding_left=6
  update_freq=15
  icon=⏺
  icon.font="Hack Nerd Font:Regular:14.0"
  icon.color=$BLUE
  label=$LOADING
  label.highlight_color=$BLUE
  popup.align=right
  popup.height=25
  script="$PLUGIN_DIR/ghmon-workflow.sh"
  click_script="$POPUP_CLICK_SCRIPT"
  # associated_display=1
)

github_template=(
  drawing=off
  background.corner_radius=12
  padding_left=7
  padding_right=7
)

sketchybar --add item github.status right \
  --set github.status "${github_status[@]}" \
  --subscribe github.status mouse.exited.global \
  \
  --add item github.template popup.github.status \
  --set github.template "${github_template[@]}"
# --subscribe github.status mouse.entered \
# mouse.exited \

ghmon_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket ghmon github.status \
  --set ghmon "${ghmon_bracket[@]}"
