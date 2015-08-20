#!/bin/sh
echo "fdisk commands: d, 2, n, p, 2, enter, enter, w";
sudo fdisk /dev/mmcblk0;
sudo reboot now;
