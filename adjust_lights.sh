#!/bin/bash

LIGHT_STATUS=$1
SCREEN_BRIGHTNESS=${2:-1}

DISPS=$(xrandr | grep -w connected | awk '{print $1}')

for disp in $DISPS; do
  xrandr --output $disp --brightness $SCREEN_BRIGHTNESS
  lcli $LIGHT_STATUS
done
