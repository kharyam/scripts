#!/bin/bash
pidof obs
if [ $? != 0 ] 
   then
      nohup /usr/local/bin/obs --startvirtualcam --scene "Camera" &
      #nohup flatpak run com.obsproject.Studio --startvirtualcam --scene "Camera" &
      sleep 3
fi

xdotool search --name "^Display Webcam .*$"
if [ $? != 0 ]
   then
      nohup python3 -m http.server -d /home/kmendez/Projects/local/webcam-browser 8087 &
      #chromium-browser --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
      vivaldi --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
fi
