#!/bin/bash

realip="PUT YOUR REAL IP ADDRESS HERE!"

addr="$(curl -sf ifconfig.co)"

if [[ $realip = $addr ]]; then  # VPN OFF!
    echo "%{F#fb4934} $addr"     # red text
else
    echo " $addr"
fi
