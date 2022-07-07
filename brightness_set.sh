#!/bin/bash
brightness=100

BRIGHTNESS_FILE=/tmp/brightness-setting

arg=${1:-'reset'}

if [ -f $BRIGHTNESS_FILE ] ; then
  brightness=$(cat $BRIGHTNESS_FILE)
fi

if [ $arg == "-" ] ; then
  new_brightness=$(($brightness - 1))
elif [ $arg == "+" ] ; then
  new_brightness=$(($brightness + 1))
elif [ $arg == "reset" ] ; then
  new_brightness=100
fi

if [ $new_brightness -lt 1 ] ; then
  new_brightness=1
elif [ $new_brightness -gt 100 ] ; then
  new_brightness=100
fi

echo -n $new_brightness > $BRIGHTNESS_FILE

bright=$(bc -l <<< "$new_brightness * .01")

xrandr --output HDMI-1 --brightness $bright --output HDMI-0 --brightness $bright
