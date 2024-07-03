#!/bin/bash
#

win_id=$(xdotool search --name "Volume")
if [ $? != 0 ]; then
  ~/bin/xvolume.sh &
  sleep 1
  win_id=$(xdotool search --name "Volume")
fi

xdotool windowmap $win_id

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

if [ "$VOLUME" -ge 100 ]; then
  VOLUME=100
  amixer -q sset Master 100%
fi

MARKER_FILE=/tmp/unmapvolumewindow.txt
if [ ! -f $MARKER_FILE ] ; then
touch $MARKER_FILE
(sleep 3 ; xdotool windowunmap $win_id ; rm $MARKER_FILE)&
fi 

#if [ "$VOLUME" -le 20 ]; then
#    ICON=audio-volume-low
#else if [ "$VOLUME" -le 60 ]; then
#         ICON=audio-volume-medium
#     else 
#         ICON=audio-volume-high
#     fi
#fi
#MUTE=$(pactl get-sink-mute @DEFAULT_SINK@)
#if [ "$MUTE" == "Mute: yes" ]; then
#    ICON=audio-volume-muted
#fi 
#
#SINK=$(pactl info | grep "Default Sink" | cut -d ' ' -f 3)
#NOTI_ID=$($HOME/.local/bin/notify-send.py "Volume $VOLUME%" "($SINK)" --expire-time 500 \
#                         --hint string:image-path:$ICON boolean:transient:true \
#                                int:has-percentage:$VOLUME ) 


