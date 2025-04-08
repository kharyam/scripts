#!/bin/bash

# Rebuild obs
cd ${HOME}/Projects/local/obs/obs-studio
git pull
git submodule update

# Build from scratch
#rm -fr ${HOME}/Projects/local/obs/obs-studio/build
#mkdir ${HOME}/Projects/local/obs/obs-studio/build

cd ${HOME}/Projects/local/obs/obs-studio/build
cmake -DENABLE_BROWSER=ON -DCEF_ROOT_DIR="../../cef_binary_6533_linux_x86_64" -DENABLE_AJA=OFF -DENABLE_NEW_MPEGTS_OUTPUT=OFF -DENABLE_WEBRTC=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON ..
make -j$(nproc)
sudo make install
#echo "/usr/local/lib" | sudo tee /etc/ld.so.conf.d/local.conf -a
sudo ldconfig
sudo cp frontend/obs /usr/local/bin
