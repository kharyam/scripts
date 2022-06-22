#!/bin/bash

if [ -eq $1 5 ]
  then
    xrandr --output HDMI-1 --brightness .3 --output HDMI-0 --brightness .3
    lc off
  else
    xrandr --output HDMI-1 --brightness 1 --output HDMI-0 --brightness 1
fi

for i in {0..10}
do
  xdotool search --desktop $i --name '^OBS .+$' windowactivate --sync key alt+shift+$1 
  if [ $? -eq 0 ]
    then
      echo "Found it at desktop $i"
      exit 0
  fi
done
