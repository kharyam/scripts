#!/bin/bash

if [ "$1" == "inc" ]; then
   amixer -q sset Master 5%+
fi

if [ "$1" == "dec" ]; then
   amixer -q sset Master 5%-
fi

if [ "$1" == "mute" ]; then
   amixer -q sset Master toggle
fi


VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@)
SINK=$(pactl info | grep "Default Sink" | cut -d ' ' -f 3)
if [ "$VOLUME" -le 20 ]; then
    ICON=audio-volume-low
else if [ "$VOLUME" -le 60 ]; then
         ICON=audio-volume-medium
     else 
         ICON=audio-volume-high
     fi
fi
if [ "$MUTE" == "Mute: yes" ]; then
    ICON=audio-volume-muted
fi 

NOTI_ID=$(/home/kmendez/.local/bin/notify-send.py "Volume $VOLUME%" "($SINK)" --expire-time 2000 \
                         --hint string:image-path:$ICON boolean:transient:true \
                                int:has-percentage:$VOLUME \
                         --replaces-process "volume-popup")
