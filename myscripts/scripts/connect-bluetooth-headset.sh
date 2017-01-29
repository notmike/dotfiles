#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
# confirm my connection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#99cc99 Bluetooth\ Headphones "CONNECTED" 

# mute the HDMI output
pacmd set-sink-mute alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2 1

# run the bluez prog and connect to my earbuds
#echo -e 'power on\nquit' | bluetoothctl

# need a little time so default goes thru successfully
#sleep 1  

# run the bluez prog and connect to my earbuds
echo -e 'connect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# need a little time so default goes thru successfully
sleep 3  

# set Volume to something reasonable
pacmd set-sink-volume bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink 9830

# set Bluetooth headset as default output
pacmd set-default-sink bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink

# need a little time so default goes thru successfully
sleep 3  

# set Bluetooth headset as default output
pacmd set-default-sink bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink

# need a little time so default goes thru successfully
sleep 1  


# TODO:
#other useful commands for future ....
# pacmd move-sink-input 18 0
# the first # is the source (last time i checked, 18 = chrome and 0 = spotify)
# the second # is the dest. (again, last time i checked, 0 = Nvidia HDMI & 2 = Bluetooth headphones)
# check out "pacmd list-sinks" to verify sink #'s
