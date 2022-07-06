#!/bin/bash

NOISETORCH="NoiseTorch Microphone for Cam Link 4K Digital Stereo (IEC958)"
SOURCE="alsa_input.usb-Elgato_Cam_Link_4K_000712A007000-03.iec958-stereo"

# Enable noise torch on virtual mic
noisetorch -u
noisetorch -i -s $SOURCE
pactl set-default-source "$NOISETORCH"
