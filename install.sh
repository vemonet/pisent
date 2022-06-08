#!/bin/bash

sudo apt-get update

# To turn on/off TV through HDMI cable
sudo apt-get install -y cec-utils unclutter

cp -r /etc/xdg/lxsession ~/.config/

# The Pi will auto run this script after starting
mkdir -p ~/bin
cp start.sh ~/bin/start.sh
echo "@/home/$USER/bin/start.sh" >> ~/.config/lxsession/LXDE-pi/autostart

# Hide the mouse cursor if not moving
echo "@unclutter -idle 2" >> ~/.config/lxsession/LXDE-pi/autostart


# Disable screensaver https://pimylifeup.com/raspberry-pi-disable-screen-blanking
xset s noblank
xset -dpms
xset s off