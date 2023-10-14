#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# Requires `curl` and `m-cli`
# TODO: Set up a `.secrets` file in `~/.config`.
# Use the `.secrets.example` as a template.
# Add `ACCESS_KEY` with the "Access Key" from the Unsplash API
# "Applications" page — https://unsplash.com/oauth/applications
# (register one here: https://unsplash.com/oauth/applications/new)
source "$HOME/.config/.secrets"

# Update
QUERY="water"
ORIENTATION="landscape"

# # Update all Wallpapers
function wallpaper() {
  sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

URL=$(
  curl --location "https://api.unsplash.com/photos/random?query=${QUERY}&orientation=${ORIENTATION}" \
    --header "Authorization: Client-ID ${ACCESS_KEY}" | jq -r '.urls.full'
)

# open $URL
TIMESTAMP=$(echo '('$(date +"%s.%N") ' * 1000000)/1' | bc)
WALLPAPER_PATH="$HOME/.config/.sketchyrw/wallpaper"
rm -rf "${WALLPAPER_PATH}/*"
wget $URL -O "${WALLPAPER_PATH}/wallpaper${TIMESTAMP}.jpg"

# TODO: After macos Sonoma figures out its Wallpaper issues, finish the below functionality and distribute to Sketchybar Discussions
# chmod 777 "${WALLPAPER_PATH}/wallpaper${TIMESTAMP}.jpg" &&
# WALLPAPER="${WALLPAPER_PATH}/wallpaper${TIMESTAMP}.jpg" &&
# echo $WALLPAPER &&
# osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"~/.config/.sketchyrw/wallpaper/wallpaper${EPOCHSECONDS}.jpg\" as POSIX file"
# wallpaper $WALLPAPER
# echo 'done'
