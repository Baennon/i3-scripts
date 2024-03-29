if [ "$1" == "inc" ]; then
	   amixer -q sset Master 5%+
fi

if [ "$1" == "dec" ]; then
	   amixer -q sset Master 5%-
fi

if [ "$1" == "mute" ]; then
	   amixer -q sset Master toggle
fi

AMIXER=$(amixer sget Master)
VOLUME=$(echo $AMIXER | grep 'Right:' | awk -F'[][]' '{ print $2 }' | tr -d "%")
MUTE=$(echo $AMIXER | grep -o '\[off\]' | tail -n 1)
TEXT=""
if [ "$VOLUME" -le 20 ]; then
	    ICON=audio-volume-low
elif [ "$VOLUME" -le 60 ]; then
	ICON=audio-volume-medium
else 
	ICON=audio-volume-high
fi
TEXT="$VOLUME%"
if [ "$MUTE" == "[off]" ]; then
	ICON=audio-volume-muted
	TEXT="Mute"
fi 



NOTI_ID=$(notify-send.py "Volume" "$TEXT" --hint string:image-path:$ICON boolean:transient:true --replaces-process "volume-popup")
