sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.weather" right \
  --set "iStat Menus Status,com.bjango.istatmenus.weather" alias.color=$WHITE
sketchybar --add alias "CopyClip 2" right \
  --set "CopyClip 2" alias.color=$WHITE

aliases_bracket=(
  background.color=0x9c1c1c1c
  background.border_color=$BACKGROUND_2
  item.padding_right=0
)

sketchybar --add item spacer right \
  --set spacer background.drawing=off \
  width=5

sketchybar --add bracket aliases "CopyClip 2" "iStat Menus Status,com.bjango.istatmenus.weather" \
  --set aliases "${aliases_bracket[@]}"
