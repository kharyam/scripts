#!/bin/bash
declare -A APPMAP

APPMAP[1) Toggle VPN]="nmcli connection up 1-Red-Hat-Global-VPN || nmcli connection down 1-Red-Hat-Global-VPN" 
APPMAP[2) 💡 On]="$HOME/.local/bin/lc on"
APPMAP[3) 💡 Off]="$HOME/.local/bin/lc off"
APPMAP[4) Files]="pcmanfm"
#APPMAP[4) Files]="QT_STYLE_OVERRIDE=Adwaita-Dark QT_QPA_PLATFORMTHEME=qt5ct krusader"
#APPMAP[4) Files]="nautilus"
APPMAP[5) Tablet]="/usr/lib/pentablet/pentablet.sh"
APPMAP[6) Volume]="pavucontrol"
APPMAP[7) PDF Fill]="xournal"
APPMAP[8) Nord VPN Connect]="/usr/bin/nordvpn c"
APPMAP[9) Nord VPN Disconnect]="/usr/bin/nordvpn d"
APPMAP[10) Wallpaper]="/usr/bin/nitrogen"
APPMAP[11) eDEXUI]="$HOME/Projects/local/edex-ui/dist/eDEX-UI-Linux-x86_64.AppImage --no-sandbox"
APPMAP[12) Display (arandr)]="arandr"
APPMAP[13) Theme/Icons (lxappearance)]="lxappearance"
APPMAP[14) QT Theme/Icons (qt5ct)]="qt5ct"
APPMAP[15) Camera]="guvcview -d $(v4l2-ctl --list-devices | grep "Cam Link" -A1 | tr -d '\t'  | grep dev)"
APPMAP[16) zeal]="zeal"
#APPMAP[Spotify]="/var/lib/snapd/snap/bin/spotify"
#APPMAP[Shotcut]="shotcut"
#APPMAP[Joplin (Notes)]="/snap/bin/joplin-james-carroll.joplin"
#APPMAP[RDP (remmina)]="9 remmina"
#APPMAP[VMM]="virt-manager"
#APPMAP[V4L]="gtk-v4l"
#APPMAP[CMS Acronyms]="xdg-open /home/kharyam/Projects/cms/CMS_Acronym_List.pdf"
#APPMAP[Pulse Effects]="pulseeffects"
#APPMAP[Gittea Token]="$HOME/bin/gittea"
#APPMAP[OBS]="obs"
#APPMAP[Calculator]="gnome-calculator"

function getKeys() {
for key in "${!APPMAP[@]}" 
  do
     echo $key
  done
}

function getSortedKeys() {
  getKeys | sort -g
}

# Add -auto-select to allow selection when exactly one match is found
selection=$(getSortedKeys | rofi -dmenu -i -window-title Command: )
#selection=$(getSortedKeys | dmenu -i )
echo Selection: $selection

if [[ -z ${APPMAP[$selection]} ]] 
then 
  $selection &
else
  sh -c "${APPMAP[$selection]}" &
fi
