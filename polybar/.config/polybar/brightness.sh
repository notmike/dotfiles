#!/bin/bash
brightness=`brightnessctl -m | awk -F, '{print $4+0}'`
echo -n " %{F#928374} %{F#fbf1c7}$brightness "
