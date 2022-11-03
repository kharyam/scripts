#!/bin/bash

pidof Joplin.AppImage
if [ $? != 0 ] 
  then
  $HOME/.joplin/Joplin.AppImage &
  $HOME/.local/bin/notify-send.py "Joplin" "Joplin is starting..." --expire-time 5000 
fi

xdotool key "Super_L+F11"
