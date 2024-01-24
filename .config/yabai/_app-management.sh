#!/bin/bash

# Fix Problematic Windows
yabai -m rule --add app="^(Digital Colou?r Meter|Classic Color Meter)$" sticky=on
yabai -m rule --add app="^(Glucose Graph|Verve|zoom.us|Zoom|Contrast|Min|Gifox|Bartender 5|CleanMyMac X|Airfoil|Messages|1Password Helper|1Password Helper (GPU)|Fantastical|Fantastical Helper|com.flexibits.fantastical.core.libical-XPC|Keyboard Maestro|TextExpander|Calculator|Software Update|Dictionary|VLC|System Preferences|System Settings|zoom.us|Photo Booth|Archive Utility|Python|LibreOffice|App Store|Steam|Alfred|Activity Monitor|sketchybar)$" manage=off
yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
yabai -m rule --add label="Safari" app="^Safari$" title="^(General|(Tab|Password|Website|Extension)s|AutoFill|Se(arch|curity)|Privacy|Advance)$" manage=off
yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
yabai -m rule --add label="Select file to save to" app="^Inkscape$" title="Select file to save to" manage=off
yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
yabai -m rule --add app="^(ProtonVPN|GeekTool|CopyClip 2|xScope|iStat Menus Status|com.bjango.istatmenus.weather|1Password Helper (Renderer)|1Password Browser Helper|^1Password$|Security/Agent)$" manage=off layer=above
