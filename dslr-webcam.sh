#!/bin/bash
sudo rmmod v4l2loopback
sudo modprobe v4l2loopback exclusive_caps=1 card_label="GPhoto2 Webcam" video_nr=10
sudo modprobe v4l2loopback card_label="OBS" video_nr=9
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video10

echo "Got an error? Did you unmount the camera in files???"
