#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#

# set volume to lower lever for when HDMI output resumes
pactl set-sink-volume @DEFAULT_SINK@ 9830

# mute the HDMI output
pactl set-sink-mute @DEFAULT_SINK@ toggle

# run the bluez prog and connect to my earbuds
echo -e 'connect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# set Bluetooth headset as default output
pactl set-default-sink bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink

# confirm my connection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#99cc99 Bluetooth\ Headphones "CONNECTED"
