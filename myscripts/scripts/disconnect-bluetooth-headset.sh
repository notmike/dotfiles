#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#

# set Volume to something reasonable
pactl set-sink-volume bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink 9830

# run the bluez prog and disconnect to my earbuds
echo -e 'disconnect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# give time for HDMI to become default sink
sleep 1

# unmute HDMI speaker
pactl set-sink-mute @DEFAULT_SINK@ toggle

# confirm disconnection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#f2777a Bluetooth\ Headphones "DISCONNECTED"
