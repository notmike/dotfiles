#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
BLUETOOTH='CC:98:8B:80:15:69'
BLUETOOTH2='CC_98_8B_80_15_69'


# set volume to lower lever for when HDMI output resumes
pactl set-sink-volume @DEFAULT_SINK@ 9830

# mute the HDMI output
pactl set-sink-mute @DEFAULT_SINK@ toggle

# run the bluez prog and connect to my earbuds
# echo -e 'connect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl
echo -e 'connect CC:98:8B:80:15:69\nquit' | bluetoothctl

# set Bluetooth headset as default output
# pactl set-default-sink bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink
pactl set-default-sink bluez_sink.CC_98_8B_80_15_69.a2dp_sink

# confirm my connection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#99cc99 Bluetooth\ Headphones "CONNECTED"
