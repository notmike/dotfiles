#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
#

# unmute the HDMI output
pacmd set-sink-mute alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2 0 

# set HDMI monitor as default output
pacmd set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2

# set volume to something reasonable
pacmd set-sink-volume alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2 9830

# run the bluez prog and disconnect to my earbuds
echo -e 'disconnect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# confirm disconnection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#f2777a Bluetooth\ Headphones "DISCONNECTED"
