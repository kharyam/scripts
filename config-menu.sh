#!/bin/bash
declare -A APPMAP

APPMAP[zsh]="vim ~/.zshrc"
APPMAP[i3]="vim /home/kmendez/.config/i3/config"
APPMAP[bumblebee]="vim /home/kmendez/.local/bin/lc off"
APPMAP[linux notification manager]="vim ~/.config/deadd/deadd.conf"
APPMAP[linux notification manager css]="vim ~/.config/deadd/deadd.css"
APPMAP[GDM Settings]="gdm-settings"

function getKeys() {
for key in "${!APPMAP[@]}" 
  do
     echo $key
  done
}

function getSortedKeys() {
  getKeys | sort -g
}

selection=$(getSortedKeys | rofi -dmenu -i -window-title Config File: )
$selection
alacritty -e vim ${APPMAP[$selection]}
