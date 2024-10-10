#!/bin/bash

# Rebuild obs
cd ${HOME}/Projects/local/obs/obs-studio
git pull
git submodule update
cd ${HOME}/Projects/local/obs/obs-studio/build
cmake -DENABLE_BROWSER=ON -DCEF_ROOT_DIR="../../cef_binary_5060_linux64" -DENABLE_AJA=OFF -DENABLE_NEW_MPEGTS_OUTPUT=OFF -DENABLE_WEBRTC=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON ..
make -j16
sudo make install
#echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/local.conf -a
sudo ldconfig
sudo cp UI/obs /usr/local/bin
