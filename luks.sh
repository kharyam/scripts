#!/bin/bash

sudo cryptsetup luksOpen /dev/nvme2n1p2 old_vol
sudo mount /dev/mapper/old_vol /mnt/old_vol
