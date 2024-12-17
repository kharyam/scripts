#!/bin/bash

## Run these steps to rebuild and install the rpm:
# cd Projects/local/displaylink-rpm
# git pull origin master
# make github-release
# find . -name "*.rpm"
# sudo dnf install -y ./x86_64/displaylink-1.14.7-4.github_evdi.x86_64.rpm

sudo sed -i.bak 's/Option "SWCursor" "on"/Option "SWCursor" "off"/g' /etc/X11/xorg.conf.d/20-displaylink.conf
sudo modinfo -n evdi /lib/modules/$(uname -r)/extra/evdi.ko.xz
sudo unxz $(modinfo -n evdi)
sudo /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der /lib/modules/$(uname -r)/extra/evdi.ko
sudo xz -f /lib/modules/$(uname -r)/extra/evdi.ko
