# Add event
sketchybar -m --add event song_update com.apple.Music.playerInfo

# Add Music Item
sketchybar -m --add item music.title center \
  --set music.title script="$PLUGIN_DIR/music.sh" \
  click_script="$PLUGIN_DIR/music_click.sh" \
  icon.padding_left=10 \
  background.padding_right=0 \
  background.padding_left=0 \
  drawing=off \
  associated_display=1 \
  --subscribe music.title song_update

# Add Music Item
sketchybar -m --add item music.artist center \
  --set music.artist drawing=off \
  click_script="$PLUGIN_DIR/music.artist_click.sh" \
  icon="»" \
  icon.y_offset=1 \
  label.font="SF Compact Display:Bold:14" \
  background.padding_right=0 \
  background.padding_left=0 \
  associated_display=1 \
  label.padding_right=5 \
  label.padding_left=5 \
  label.y_offset=1 \
  icon.padding_left=3

# Add Music Item
sketchybar -m --add item music.album center \
  --set music.album drawing=off \
  icon="«" \
  icon.y_offset=1 \
  background.padding_right=0 \
  background.padding_left=0 \
  associated_display=1 \
  label.padding_right=0 \
  label.padding_left=5 \
  icon.padding_left=0

music_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket music music.title music.artist music.album \
  --set music "${music_bracket[@]}"
