#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
bluetooth=CC:98:8B:80:15:69
bluetooth2=CC_98_8B_80_15_69

# set Volume to something reasonable
pactl set-sink-volume bluez_sink.CC_98_8B_80_15_69.a2dp_sink 9830

# run the bluez prog and disconnect to my earbuds
echo -e 'disconnect CC:98:8B:80:15:69\nquit' | bluetoothctl

# give time for HDMI to become default sink
sleep 1

# unmute HDMI speaker
pactl set-sink-mute @DEFAULT_SINK@ toggle

# confirm disconnection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#f2777a Bluetooth\ Headphones "DISCONNECTED"
