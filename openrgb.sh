#!/bin/bash
sudo modprobe i2c-i801
sudo modprobe i2c-dev
sudo udevadm control --reload-rules && sudo udevadm trigger
~/Projects/local/OpenRGB/openrgb --profile ~/.config/OpenRGB/Default.orp
