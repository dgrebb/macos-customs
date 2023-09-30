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
  popup.height=5
  script="$PLUGIN_DIR/ghmon-workflow.sh"
  click_script="$POPUP_CLICK_SCRIPT"
  # associated_display=1
)

gh_spacer=(
  icon.drawing=off
  label.drawing=off
  background.height=7
  width=110
  background.drawing=on
)

github_template=(
  drawing=off
  background.corner_radius=12
  label.padding_right=5
  icon.padding_left=5
  padding_left=7
  padding_right=7
  background.height=22
  background.color=$TRANSPARENT
  background.drawing=on
)

sketchybar --add item github.status right \
  --set github.status "${github_status[@]}" \
  --subscribe github.status mouse.exited.global \
  \
  --add item gh.spacer popup.github.status \
  --set gh.spacer "${gh_spacer[@]}" \
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
