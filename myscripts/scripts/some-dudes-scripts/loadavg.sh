#!/bin/bash
average=`ps -A -o pcpu | sort -r | awk '{if(NR==2) print}' |  cut -d . -f 1`
if [ $average -gt 90 ]
then
	notify-send " CPU Overload" "Loadavg at $average"
	sleep 30
else
	:
fi