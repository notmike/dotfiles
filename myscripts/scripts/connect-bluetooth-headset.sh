#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#

# mute the speaker output
pacmd set-sink-mute alsa_output.pci-0000_00_1b.0.analog-stereo 1

# run the bluez prog and connect to my earbuds
echo -e 'power on\nquit' | bluetoothctl 

sleep 1

echo -e connect '44:5E:F3:AB:67:A0\nquit' | bluetoothctl

# need a little time so default goes thru successfully
sleep 7  

# set Bluetooth headset volume to something reasonable
pacmd set-sink-volume bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink 9830

# set Bluetooth headset as default output
pacmd set-default-sink bluez_sink.44_5E_F3_AB_67_A0.a2dp_sink


# confirm my connection
notify-send -h string:bgcolor:#393939 -h string:fgcolor:#99cc99 Bluetooth\ Headphones "CONNECTED" 
