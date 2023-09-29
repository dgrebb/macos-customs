#!/bin/bash

sketchybar --add item network_r_spacer right \
  --set network_r_spacer background.drawing=off \
  associated_display=1 \
  width=5

sketchybar --add item ip_address right \
  --set ip_address script="~/.config/sketchybar/plugins/ip_address.sh" \
  update_freq=30 \
  padding_left=2 \
  padding_right=1 \
  background.border_width=0 \
  background.corner_radius=6 \
  background.height=24 \
  icon.highlight=off \
  label.highlight=off \
  associated_display=1 \
  --subscribe ip_address wifi_change

sketchybar --add item network.up right \
  --set network.up script="~/.config/sketchybar/plugins/network.sh" \
  update_freq=10 \
  padding_left=2 \
  padding_right=2 \
  background.border_width=0 \
  background.height=24 \
  icon=⇡ \
  icon.color=$YELLOW \
  label.color=$YELLOW \
  associated_display=1

sketchybar --add item network.down right \
  --set network.down script="~/.config/sketchybar/plugins/network.sh" \
  update_freq=10 \
  padding_left=8 \
  padding_right=2 \
  background.border_width=0 \
  background.height=24 \
  icon=⇣ \
  icon.color=$GREEN \
  label.color=$GREEN \
  associated_display=1

sketchybar --add item network_spacer right \
  --set network_spacer background.drawing=off \
  width=5 \
  associated_display=1


# Bracket

sketchybar --add bracket status ip_address network.up network.down \
  --set status background.color=$BACKGROUND_1 \
  background.border_color=$BACKGROUND_2