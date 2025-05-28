#!/usr/bin/env sh
layout=$(yabai -m query --spaces --space | jq -r '.type')

if [[ "$layout" = "stack" ]]; then
	if [[ "$1" = "left" ]]; then
		yabai -m window --focus stack.prev && return 0
	fi

	if [[ "$1" = "right" ]]; then
		yabai -m window --focus stack.next && return 0
	fi
fi

if [[ "$layout" = "bsp" ]]; then
	if [[ "$1" = "left" ]]; then
		yabai -m window --focus west && return 0
	fi

	if [[ "$1" = "right" ]]; then
		yabai -m window --focus east && return 0
	fi
fi
