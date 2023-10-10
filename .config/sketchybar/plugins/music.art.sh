#!/bin/bash

# Get the path of the currently playing album art in Music.app

# Specify the temporary directory and file name with a .png extension
temp_dir="$HOME/.config/.sketchyrw"
temp_file="$temp_dir/album_art.png"

# Ensure the temporary directory exists
mkdir -p "$temp_dir"

# Run AppleScript to get the album art path
album_art_path=$(osascript -e '
tell application "Music"
    if player state is playing then
        set currentTrack to current track
        set artworkData to raw data of artwork 1 of currentTrack
        if artworkData is not {} then
            set fileName to POSIX file "'"$temp_file"'"
            set fileNumber to open for access fileName with write permission
            write artworkData to fileNumber
            close access fileNumber
            return fileName
        else
            return "No album art"
        end if
    else
        return "No music playing"
    end if
end tell
')
