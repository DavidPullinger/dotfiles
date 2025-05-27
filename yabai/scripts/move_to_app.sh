#!/usr/bin/env sh

# find space of app passed in
queried_space=$(yabai -m query --windows | jq ".[] | select(.app == \"$1\") | .space")

if [ -n "${queried_space}" ]; then
	yabai -m space --focus $queried_space
fi
