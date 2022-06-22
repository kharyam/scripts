#!/bin/bash
pidof obs
if [ $? != 0 ] 
   then
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib 
      nohup /usr/local/bin/obs --startvirtualcam --scene "Camera" &
      sleep 10 
fi

xdotool search --name "^Display Webcam .*$"
if [ $? != 0 ]
   then
      nohup python3 -m http.server -d /home/kmendez/Projects/local/webcam-browser 8087 &
      #chromium-browser --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
      vivaldi --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
fi
