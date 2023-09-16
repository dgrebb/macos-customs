#!/bin/bash

# Disable SIP
# https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

# Upgrade
# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#updating-to-the-latest-release

hash=$(shasum -a 256 $(which yabai))
sudo echo $(whoami) ALL=(root) NOPASSWD: sha256:$hash $(which yabai) --load-sa >> /private/etc/sudoers.d/yabai