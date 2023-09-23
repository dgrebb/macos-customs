alias=(
  alias.color=$WHITE
  background.padding_left=0
  background.padding_right=0
  associated_display=1
)

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.memory" right \
  --set "iStat Menus Status,com.bjango.istatmenus.memory" "${alias[@]}" \
  alias.color=yellow \
  width=15 \
  associated_display=1

sketchybar --add alias "iStat Menus Status,com.bjango.istatmenus.cpu" right \
  --set "iStat Menus Status,com.bjango.istatmenus.cpu" "${alias[@]}" \
  alias.color=0xff8b85ff \
  width=20 \
  associated_display=1

sketchybar --add alias "Shifty,Item-0" right \
  --set "Shifty,Item-0" "${alias[@]}" \
  alias.color=$WHITE \
  width=30 \
  click_script="nightlight toggle" \
  associated_display=1

aliases_bracket=(
  background.color=0x9c1c1c1c
  background.border_color=$BACKGROUND_2
  associated_display=1
)

sketchybar --add item spacer1 right \
  --set spacer1 background.drawing=off \
  associated_display=1 \
  width=23

sketchybar --add bracket aliases "Shifty,Item-0" "iStat Menus Status,com.bjango.istatmenus.memory" "iStat Menus Status,com.bjango.istatmenus.cpu" \
  --set aliases "${aliases_bracket[@]}" \
  associated_display=1
