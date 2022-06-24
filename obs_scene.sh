#!/bin/bash

CAMERA=1
SCREEN_SHARE=2
STAND_BY=3
BACK_IN=4
WHITE_BOARD=5
NEWS=6

if [[ $1 == $WHITE_BOARD ]]
  then
    sleep 4
    xrandr --output HDMI-1 --brightness .4 --output HDMI-0 --brightness .4
elif [[ $1 == $CAMERA ]]
  then
    xrandr --output HDMI-1 --brightness .5 --output HDMI-0 --brightness .5
else
    xrandr --output HDMI-1 --brightness 1 --output HDMI-0 --brightness 1
fi

if [[ $1 == @($CAMERA|$SCREEN_SHARE|$NEWS) ]]
  then
    ${HOME}/.local/bin/lc on
  else
    ${HOME}/.local/bin/lc off
fi

for i in {0..10}
do
  xdotool search --desktop $i --name '^OBS .+$' windowactivate --sync key alt+shift+$1 
  if [ $? -eq 0 ]
    then
      echo "Found OBS at desktop $i"
      exit 0
  fi
done
