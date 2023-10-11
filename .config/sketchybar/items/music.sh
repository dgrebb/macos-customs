# Add event
sketchybar -m --add event song_update com.apple.Music.playerInfo

# Different workstations have different Music.app API versions
if [[ "$MACHINE" == 'work' ]]; then
  MUSIC_CLICK_SCRIPT="$PLUGIN_DIR/music_click-work.sh"
else
  MUSIC_CLICK_SCRIPT="$PLUGIN_DIR/music_click.sh"
fi

# Add Music Item
sketchybar -m --add item music.title center \
  --set music.title script="$PLUGIN_DIR/music.sh" \
  click_script="$MUSIC_CLICK_SCRIPT" \
  icon.padding_left=15 \
  background.padding_right=0 \
  background.padding_left=0 \
  label.font="SF Compact Display:Regular:14" \
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
  icon.padding_left=3

# Add Music Item
sketchybar -m --add item music.album center \
  --set music.album drawing=off \
  script="$PLUGIN_DIR/music.art.sh" \
  icon="«" \
  icon.y_offset=1 \
  background.padding_right=0 \
  background.padding_left=0 \
  associated_display=1 \
  label.font="SF Compact Display:Regular:14" \
  label.padding_right=15 \
  label.padding_left=5 \
  icon.padding_left=0 \
  --subscribe music.album song_update

music_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add bracket music music.title music.artist music.album \
  --set music "${music_bracket[@]}"
