#!/bin/bash
pidof obs
if [ $? != 0 ] 
   then
      sudo rmmod v4l2loopback
      sudo modprobe v4l2loopback card_label="OBS"
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib 
      nohup /usr/local/bin/obs --startvirtualcam --scene "Camera" &
   sleep 15
fi


xdotool search --name "^Display Webcam .*$"
if [ $? != 0 ]
   then
      nohup python3 -m http.server -d $HOME/Projects/local/webcam-browser 8087 &
      google-chrome --new-window --enable-features=OverlayScrollbar --profile-directory="Default" --app=http://localhost:8087
      #brave-browser --new-window --enable-features=OverlayScrollbar --profile-directory="Default" --app=http://localhost:8087
      #vivaldi --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
      #firefox -P 'Red Hat' --kiosk --windowsize 1920,1080 http://localhost:8087
fi
