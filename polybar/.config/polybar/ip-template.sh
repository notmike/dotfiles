#!/bin/bash

realip="PUT YOUR REAL IP ADDRESS HERE!"

addr="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if [[ $realip = $addr ]]; then  # VPN OFF!
    echo "%{F#fb4934} $addr"     # red text
else
    echo " $addr"
fi
