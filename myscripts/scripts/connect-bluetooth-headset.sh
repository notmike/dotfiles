#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
#
# run the bluez prog and connect to my earbuds
echo -e 'connect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# TODO:
#other useful commands for future ....
# pacmd move-sink-input 18 0
# the first # is the source (last time i checked, 18 = chrome and 0 = spotify)
# the second # is the dest. (again, last time i checked, 0 = Nvidia HDMI & 2 = Bluetooth headphones)
# check out "pacmd list-sinks" to verify sink #'s
