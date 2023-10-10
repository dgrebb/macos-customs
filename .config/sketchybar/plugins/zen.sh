#!/bin/bash

zen_on() {
  sketchybar --set wifi drawing=off \
    --set apple.logo drawing=off \
    --set '/cpu.*/' drawing=off \
    --set calendar icon.drawing=off \
    --set separator drawing=off \
    --set front_app drawing=off \
    --set volume_icon drawing=off \
    --set spotify.anchor drawing=off \
    --set spotify.play updates=off \
    --set utils drawing=off \
    --set ghmon drawing=off \
    --set github.status drawing=off \
    --set omnifocus drawing=off \
    --set "iStat Menus Status,com.bjango.istatmenus.cpu" drawing=off \
    --set "iStat Menus Status,com.bjango.istatmenus.memory" drawing=off \
    --set nightshift drawing=off \
    --set network.up drawing=off \
    --set network.down drawing=off \
    --set ip_address drawing=off \
    --set mail drawing=off \
    --set teams drawing=off
}

zen_off() {
  sketchybar --set wifi drawing=on \
    --set apple.logo drawing=on \
    --set '/cpu.*/' drawing=on \
    --set calendar icon.drawing=on \
    --set separator drawing=on \
    --set front_app drawing=on \
    --set volume_icon drawing=on \
    --set spotify.play updates=on \
    --set utils drawing=on \
    --set ghmon drawing=on \
    --set github.status drawing=on \
    --set omnifocus drawing=on \
    --set "iStat Menus Status,com.bjango.istatmenus.cpu" drawing=on \
    --set "iStat Menus Status,com.bjango.istatmenus.memory" drawing=on \
    --set nightshift drawing=on \
    --set network.up drawing=on \
    --set network.down drawing=on \
    --set ip_address drawing=on \
    --set mail drawing=on \
    --set teams drawing=on
}

if [ "$1" = "on" ]; then
  zen_on
elif [ "$1" = "off" ]; then
  zen_off
else
  if [ "$(sketchybar --query apple.logo | jq -r ".geometry.drawing")" = "on" ]; then
    zen_on
  else
    zen_off
  fi
fi
