#!/usr/bin/env bash

awww-daemon &
awww img  ~/.config/hypr/background4.jpg
nm-applet --intecator &
waybar -c ~/.config/waybar/config.json  -s ~/.config/waybar/style.css &
mako &
hypridle&
zuplin&
