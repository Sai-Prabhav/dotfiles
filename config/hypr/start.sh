#!/usr/bin/env bash

swww-daemon &
swww img  ~/.config/hypr/background3.jpeg
nm-applet --intecator &
waybar -c ~/.config/waybar/config.json  -s ~/.config/waybar/style.css &
mako &
