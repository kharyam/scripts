#!/bin/bash

CAMERA=1
SCREEN_SHARE=2
STAND_BY=3
BACK_IN=4
WHITE_BOARD=5
NEWS=6

DISP=$(xrandr | grep -w connected | awk '{print $1}')

if [[ $1 == $WHITE_BOARD ]]
  then
    sleep 3
    xrandr --output $DISP --brightness .3
elif [[ $1 == $CAMERA ]]
  then
    xrandr --output $DISP --brightness .6
else
    xrandr --output $DISP --brightness 1
fi

for i in {0..10}
do
  xdotool search --desktop $i --name '^OBS .+$' windowactivate --sync key alt+shift+$1 
  if [ $? -eq 0 ]
    then
      echo "Found OBS at desktop $i"
      break
  fi
done

if [[ $1 == @($CAMERA|$SCREEN_SHARE|$NEWS) ]]
  then
    ${HOME}/bin/lcli on
  else
    ${HOME}/bin/lcli off
fi
