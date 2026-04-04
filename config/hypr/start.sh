#!/usr/bin/env bash

awww-daemon &
awww img  ~/.config/hypr/background3.jpeg
nm-applet --intecator &
waybar -c ~/.config/waybar/config.json  -s ~/.config/waybar/style.css &
mako &
