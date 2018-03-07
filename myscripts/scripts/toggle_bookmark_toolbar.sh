#!/bin/bash

# WID=`xdotool search "Mozilla Firefox" | head -1`
# xdotool windowactivate --sync $WID
# xdotool key --clearmodifiers alt v t b

xdotool search "Mozilla Firefox" windowactivate --sync key --clearmodifiers alt v t b
