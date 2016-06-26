#!/bin/bash
batmode=-1
newmusic="default"
while  true
do
musicmode=`mpc | awk '{ if(NR==2) print $1}'` 
music=`mpc | grep -`
adapter=`acpi -a | awk '{print $3}'`
percent=`acpi -b | acpi -b | awk '{print $4}' | cut -d % -f 1`
if [ "$adapter" == "on-line" ] && [ $batmode -ne 1 ]
then
	batmode=1
	notify-send "  Battery Charging" "Battery percent at $percent"
	xbacklight -set 100
elif [ "$adapter" == "off-line" ] && [ $batmode -ne 0 ]
then
	batmode=0
	xbacklight -set	 25

elif [ "$music"  != "$newmusic" ] && [ "$musicmode" == "[playing]" ]
then
	newmusic=$music
	killall dunst
	notify-send "  Now playing" "$newmusic"
else
	:
fi
done
