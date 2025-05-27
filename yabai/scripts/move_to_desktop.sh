#!/usr/bin/env sh

# find space of desktop passed in
queried_space=$(yabai -m query --spaces | jq '.[] | select(.id == 1) | .index')

if [ -n "${queried_space}" ]; then
	yabai -m space --focus $queried_space
fi
