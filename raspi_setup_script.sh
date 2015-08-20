#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "usage: $0 number";
  exit 1;
fi
sudo apt-get install linux-firmware;
sudo apt-get install dphys-swapfile;
sudo apt-get install libraspberrypi-bin libraspberrypi-dev;
sudo ln -s /usr /opt/vc
sudo apt-get install wireless-tools;
sudo sh -c "echo 'allow-hotplug wlan0' >> /etc/network/interfaces";
sudo sh -c "echo 'auto wlan0' >> /etc/network/interfaces";
sudo sh -c "echo 'iface wlan0 inet static' >> /etc/network/interfaces";
sudo sh -c "echo '  address 192.168.0.1' >> /etc/network/interfaces";
sudo sh -c "echo '  netmask 255.255.255.0' >> /etc/network/interfaces";
sudo sh -c "echo '  wireless-channel $1' >> /etc/network/interfaces";
sudo sh -c "echo '  wireless-essid RaspberryPi$1' >> /etc/network/interfaces";
sudo sh -c "echo '  wireless-mode ad-hoc' >> /etc/network/interfaces";
