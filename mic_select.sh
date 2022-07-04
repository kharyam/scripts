#!/bin/bash

# Enable noise torch on virtual mic
noisetorch -u
noisetorch -i -s Virtual_Mic

MIC=$(zenity --list --radiolist --hide-header --hide-column=3 --print-column=3 --text="Microphone Select" --column="Radio" --column="Friendly" --column="Actual" \
        "" "Noise Corrected Virtual Mic" "NoiseTorch Microphone for Virtual_Mic" \
	"" "Sony Camera Attached Mic" "alsa_input.usb-Elgato_Cam_Link_4K_000712A007000-03.analog-stereo" \
        "" "Blue Yeti" "alsa_input.usb-C-Media_Electronics_Inc._USB_Advanced_Audio_Device-00.iec958-stereo" )
echo $MIC
pactl set-default-source "$MIC"
