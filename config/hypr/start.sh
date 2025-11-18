#!/usr/bin/env bash

swww-daemon &
swww img  ./background2.png
nm-applet --intecator &
waybar -c ~/.config/waybar/config  -s ~/.config/waybar/style.css &
mako &
syncthing &

