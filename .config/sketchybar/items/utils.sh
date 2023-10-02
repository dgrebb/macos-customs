utils_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  associated_display=1
)

sketchybar --add bracket utils volume_icon omnifocus teams "Shifty,Item-0" "iStat Menus Status,com.bjango.istatmenus.memory" "iStat Menus Status,com.bjango.istatmenus.cpu" \
  --set utils "${utils_bracket[@]}" \
  associated_display=1
