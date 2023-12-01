#!/bin/bash

# focus window after active space changes
yabai -m signal --add event=space_changed action="yabai -m window --focus \$(yabai -m query --windows --space | jq .[0].id)"
# focus window after active display changes
yabai -m signal --add event=display_changed action="yabai -m window --focus \$(yabai -m query --windows --space | jq .[0].id)"
