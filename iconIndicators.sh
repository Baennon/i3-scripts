#!/bin/sh
VOLUME="$(amixer sget Master | grep Playback | tail -n 1 | awk '{print $5}' | sed 's/\[//;s/\]//;s/\%//')"
VOLUMESTATUS="$(amixer sget Master | grep Playback | tail -n 1 | awk '{print $6}' | sed 's/\[//;s/\]//')"
BATTERYSTATE="$(acpi | awk '{print $3}' | sed 's/,//')"
BATTERYPERCENT="$(acpi | awk '{print $4}' | sed 's/\%//;s/,//')"

if [ "$VOLUMESTATUS" = "on" ]; then
	if [ "$VOLUME" -ge 66 ]; then
		VOLUMESTRING="<big>墳</big>"
	elif [ "$VOLUME" -ge 33 ]; then
		VOLUMESTRING="<big>奔</big>"
	elif [ "$VOLUME" -ge 1 ]; then
		VOLUMESTRING="<big></big>"
	else
		VOLUMESTRING="<big>婢</big>"
	fi
else
		VOLUMESTRING="<big>婢</big>"
fi

if [ "$BATTERYSTATE" = "Full" ]; then
	BATTERYSTRING=""
elif [ "$BATTERYSTATE" = "Discharging" ] || [ "$BATTERYSTATE" = "Charging" ]; then
	if [ "$BATTERYPERCENT" -le 20 ]; then
		BATTERYSTRING=""
	elif [ "$BATTERYPERCENT" -le 40 ]; then
		BATTERYSTRING=""
	elif [ "$BATTERYPERCENT" -le 60 ]; then
		BATTERYSTRING=""
	elif [ "$BATTERYPERCENT" -le 80 ]; then
		BATTERYSTRING=""
	elif [ "$BATTERYPERCENT" -le 100 ]; then
		BATTERYSTRING=""
	fi;
	if [ "$BATTERYSTATE" = "Charging" ]; then
		BATTERYSTRING=" $BATTERYSTRING"
	fi;
else
	BATTERYSTRING=""
fi;
echo "$VOLUME% $VOLUMESTRING $BATTERYPERCENT% $BATTERYSTRING"
