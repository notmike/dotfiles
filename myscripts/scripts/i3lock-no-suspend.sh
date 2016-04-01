#!/bin/bash
 
#depends on: imagemagick, i3lock, scrot
 
#IMAGE=/tmp/lockscreen.png
#TEXT=/tmp/locktext.png
#ICON=$HOME/.config/i3/Lock-icon.png
# 
#scrot $IMAGE
#convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 25% $IMAGE
#[ -f $TEXT ] || {
#    convert -size 3000x60 xc:white -font Liberation-Sans -pointsize 26 -fill black -gravity center -annotate +0+0 'Type password to unlock' $TEXT;
#    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
#}
#convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
#convert $IMAGE $ICON -gravity center -composite -matte $IMAGE

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
#IMAGE=$HOME/Pictures/Wallpapers/bleeding-mountains.png
IMAGE=$HOME/Pictures/lockscreen.png
i3lock -i $IMAGE
