#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --off --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-5 --off
sleep 3
i3 restart
