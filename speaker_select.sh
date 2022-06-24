#!/bin/bash
SINK=$(zenity --list --radiolist --hide-header --hide-column=3 --print-column=3 --text="Speaker Select" --column="Radio" --column="Friendly" --column="Actual" \
	"" "Bluetooth" "bluez_output.E3_28_E9_23_20_79.a2dp-sink" \
        "" "Headphones" "alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.iec958-stereo" \
        "" "Monitor" "alsa_output.pci-0000_01_00.1.hdmi-stereo")

pactl set-default-sink $SINK
/home/kmendez/bin/volume.sh
