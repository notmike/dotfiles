#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 3840x2160 --pos 0x0 --rotate right --output DP-3 --off --output DP-4 --off --output DP-5 --off
sleep 3
i3 restart
