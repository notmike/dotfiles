#!/bin/sh

muted=$(pamixer --sink @DEFAULT_SINK@ --get-mute)

if [ "$muted" = true ] ; then
    echo "%{F#928374} "
else
    volume=$(pamixer --sink @DEFAULT_SINK@ --get-volume)

    if [ "$volume" -gt 79 ] ; then
        echo "%{F#fb4934}  $volume %"
    elif [ "$volume" -gt 49 ] ; then
        echo "%{F#d79921}  $volume %"
    else
        echo "%{F#b8bb26} $volume %"
    fi
fi
