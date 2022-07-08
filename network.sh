#!/bin/sh
ACTIVEWIFI="$(nmcli c s --active | wc -l)"
WIFINAME=""

[[ -z "${BLOCK_BUTTON}" ]] || /bin/sh ~/.config/rofi/applets/applets/network.sh &

if [ "$ACTIVEWIFI" -ge 2 ]; then
	WIFINAME="$(nmcli c s --active | awk 'NF{NF-=3};1' | tail -n 1)"
	WIFISTRING="<big>直</big>"
else
	WIFISTRING="<big>睊</big>"
fi
echo "$WIFINAME $WIFISTRING"
