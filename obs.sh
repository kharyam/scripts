#!/bin/bash
pidof obs
if [ $? != 0 ]; then
  sudo rmmod v4l2loopback
  sudo modprobe v4l2loopback card_label="OBS"
  #export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64
  echo Preparing to start OBS...
  sleep 3
  nohup /usr/local/bin/obs --startvirtualcam --scene "Blank" &
fi

#xdotool search --name "^Display Webcam .*$"
#if [ $? != 0 ]
#   then
#      sleep 10
#      nohup python3 -m http.server -d $HOME/Projects/local/webcam-browser 8087 &
#      brave-browser --new-window --enable-features=OverlayScrollbar --profile-directory="Profile 2" --app=http://localhost:8087
#      #google-chrome --new-window --enable-features=OverlayScrollbar --profile-directory="Default" --app=http://localhost:8087
#      #vivaldi --new-window --profile-directory="Profile 1" --enable-features=OverlayScrollbar --app=http://localhost:8087
#      #firefox -P 'Red Hat' --kiosk --windowsize 1920,1080 http://localhost:8087
#fi
