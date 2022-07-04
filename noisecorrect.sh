#!/bin/bash

NOISETORCH="NoiseTorch Microphone for Virtual_Mic"

# Enable noise torch on virtual mic
noisetorch -u
noisetorch -i -s Virtual_Mic
pactl set-default-source "$NOISETORCH"
