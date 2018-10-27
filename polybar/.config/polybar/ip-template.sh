#!/bin/bash

realip="PUT YOUR REAL IP ADDRESS HERE!"

addr="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if [[ $addr =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then

    if [[ $realip = $addr ]]; then  # VPN OFF!
        echo "%{F#fb4934} $addr"     # red text
    else
        echo " $addr"
    fi

else
    echo "%{F#d65d0e} $addr"     # red text
fi
