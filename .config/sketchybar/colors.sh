#!/bin/bash

# Color Palette
# https://felixkratz.github.io/SketchyBar/config/tricks#color-picker
export BLACK=0xff181926
export WHITE=0xbaffffff
export RED=0xffd75a00
export GREEN=0xffa6da95
export BLUE=0xff8aadf4
export YELLOW=0xffeed49f
export ORANGE=0xfff5a97f
export MAGENTA=0xffc6a0f6
export GREY=0xff939ab7
export TRANSPARENT=0x00000000

# General bar colors
export BAR_COLOR=0x00000000
export BAR_BORDER_COLOR=0xff494d64 #0xa024273a
export ICON_COLOR=$WHITE           # Color of all icons
export LABEL_COLOR=$WHITE          # Color of all labels
export BACKGROUND_1=0x9c1c1c1c
export BACKGROUND_2=0x4a787878
export HIGHLIGHT_BORDER=0x63c8c8c8
export HIGHLIGHT=0x54ffffff

export POPUP_BACKGROUND_COLOR=0x9c1c1c1c
export POPUP_BORDER_COLOR=0x87ffffff

export SHADOW_COLOR=$BLACK

# type=$(yabai -m query --spaces --window | jq '.[].type'); if [ "$type" = "\"bsp\"" ]; then yabai -m space --layout float && type="float"; else yabai -m space --layout bsp; fi; && osascript -e 'display notification "Space set to $type" with title "Yabai"'
