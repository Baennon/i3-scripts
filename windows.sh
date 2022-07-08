#!/bin/sh
title="$(xtitle)"
nbOfWindows="$(xdotool search --al --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) '' | wc -l)"
separator=" | "
terminal="s"
if [ "$nbOfWindows" = "1" ]; then
	terminal=""
elif [ "$nbOfWindows" = "0" ]; then
	separator=""
fi
echo "$title$separator$nbOfWindows window$terminal"
