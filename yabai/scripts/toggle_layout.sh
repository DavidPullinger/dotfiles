#!/usr/bin/env sh
new_layout=$(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "stack" else "bsp" end')
yabai -m space --layout $new_layout
