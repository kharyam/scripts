#!/bin/bash
pidof obs
if [ $? != 0 ] 
   then
      nohup /usr/bin/obs --startvirtualcam --studio-mode --scene "Camera" &
      # --minimize-to-tray
      sleep 2
      nohup python3 -m http.server -d /home/kmendez/Projects/local/webcam-browser 8087 &
      vivaldi --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
fi
