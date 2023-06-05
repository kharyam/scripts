#!/bin/bash

sudo cryptsetup luksOpen /dev/nvme1n1p3 old_Vol
sudo mount /dev/mapper/old_vol /mnt/old_vol
