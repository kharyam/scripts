#!/bin/bash

xrandr --output HDMI-1 --brightness 1 --output HDMI-0 --brightness 1

zenity --scale --text "Screen Brightness" --value=100 --print-partial | 
  while IFS= read -r b
  do
    brightness=$(echo "$b * 0.01" | bc -l)
    xrandr --output HDMI-1 --brightness $brightness --output HDMI-0 --brightness $brightness
  done
