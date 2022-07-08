#!/bin/sh
if [ "$BLOCK_BUTTON" = "1" ]; then
	playerctl previous
elif [ "$BLOCK_BUTTON" = "3" ]; then
	playerctl next
elif [ "$BLOCK_BUTTON" = "2" ]; then
	playerctl play-pause
fi;
echo "$(playerctl metadata title) - $(playerctl metadata artist)"
