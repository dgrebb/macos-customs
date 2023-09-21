# Add event
sketchybar -m --add event song_update com.apple.iTunes.playerInfo

# Add Music Item
sketchybar -m --add item music center \
  --set music script="$PLUGIN_DIR/music.sh" \
  click_script="$PLUGIN_DIR/music_click.scpt" \
  label.padding_right=10 \
  icon.padding_left=10 \
  drawing=off \
  associated_display=1 \
  --subscribe music song_update

music_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket musicb music \
  --set musicb "${music_bracket[@]}"
