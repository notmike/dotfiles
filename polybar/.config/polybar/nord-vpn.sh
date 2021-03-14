#!/bin/bash

addr="$(curl -sf ifconfig.co)"
vpnstatus="$(nordvpn status)"
disconnected='Disconnected'

if [[ "$vpnstatus" == *"$disconnected"* ]]; then  # VPN OFF!
    echo "%{F#fb4934} $addr"     # red text

    # Kill qBittorrent if VPN is OFF
    torrent="$(pgrep qbittorrent)"
    if [[ $torrent -gt 0 ]]; then
        pkill -9 qbittorrent
        notify-send -u critical -t 30000 "KILLING qBittorrent!
    KILLING qBittorrent!
    KILLING qBittorrent!
    KILLING qBittorrent!
    KILLING qBittorrent!"
    fi
else
    echo " $addr"
fi

