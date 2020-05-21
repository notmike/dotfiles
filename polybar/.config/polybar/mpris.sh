#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=" "
player_status="$(playerctl status 2> /dev/null)"

if [[ $? -eq 0 && $(playerctl -l) == *"spotify"* ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
    # Foreground color formatting tags are optional
    if [[ $player_status = "Playing" ]]; then
        echo "%{F#8ec07c}$icon %{F#b8bb26}$metadata"    # Green when playing
    else
        echo ""
    fi
else
    echo "%{F#8ec07c}$icon"
fi

