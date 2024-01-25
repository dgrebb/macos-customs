#!/bin/bash

# Settings
# VAULT_PATH="/Users/dgrebb/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Office"
# TEMPLATE_PATH="$VAULT_PATH/_Logs/_Templates"

# # Get Date
# DATE=$()

# # Copy Template
# TEMPLATE=$(cat $TEMPLATE_PATH/_Daily.md)

# Get Tomorrow's Activities from Apple Calendar
TEXT=$(icalBuddy -n -sc -ss "" -b "- [ ] " -ab "- [ ] ‼️ " -iep title,datetime -ps "| ⤇ |" -po "datetime,title" -tf "%H:%M" -nrd -df "" eventsFrom:"tomorrow" to:"tomorrow")

# Print that list to the "# Today" section of tomorrow's Daily Obsidian note
# echo "# Today's Activities" >>
echo "$TEXT"
