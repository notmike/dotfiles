#!/bin/bash
#
#	This script will save me a little time by connecting my bluetooth headset
#
#
# run the bluez prog and disconnect to my earbuds
echo -e 'disconnect 44:5E:F3:AB:67:A0\nquit' | bluetoothctl
