sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.weather" right \
  --set "iStat Menus Status,com.bjango.istatmenus.weather" alias.color=$WHITE \
  background.padding_left=0 \
  background.padding_right=0 \
  associated_display=1
sketchybar --add alias "CopyClip 2" right \
  --set "CopyClip 2" alias.color=$WHITE \
  background.padding_left=0 \
  background.padding_right=0 \
  associated_display=1

aliases_bracket=(
  background.color=0x9c1c1c1c
  background.border_color=$BACKGROUND_2
)

sketchybar --add item spacer1 right \
  --set spacer1 background.drawing=off \
  associated_display=1 \
  width=5

sketchybar --add bracket aliases "CopyClip 2" "iStat Menus Status,com.bjango.istatmenus.weather" \
  --set aliases "${aliases_bracket[@]}" \
  associated_display=1
