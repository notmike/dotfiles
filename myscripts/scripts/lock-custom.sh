#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

# log this scripts full output
# exec >> ~/.lock.log 2>&1

# load some defaults
# source "$HOME/etc/defaults"

i3lock_icons="$HOME/Pictures/icons/i3lock"
i3lock_icon="${i3lock_icons}/token.png"
# lockscreen="${1:-$default_lockscreen}"
lockscreen="blurred"
lockscreen_image="$HOME/.lockscreen.png"

screenshot_image="$HOME/Pictures/Screenshots/lockscreen.png"

MYUID="$(id -u "${USER}")"
PIDPATH=/var/run/user/${MYUID:-1000}/i3lock
PIDFILE=${PIDPATH}/pid
install -g mg -o mg -m 700 -d "${PIDPATH}"


##############################
## subroutines              ##
##############################

function make_blurred() {
	BLUR="-blur 0x5"

	# take a screenshot and blur it for the lock screen
	/usr/bin/maim --format=png --hidecursor --quality 7 --quiet "$screenshot_image"
	convert "$screenshot_image" ${BLUR} "$lockscreen_image"
}

function annotate_lockscreen() {
	TEXT=""

	local image
	image="${1:-$lockscreen}"
	ICON="${i3lock_icon}"
	# for some reason "convert -list font" returns 1
	FONT="$( (convert -list font ||:) | awk "{ a[NR] = \$2 } /family: $(fc-match sans -f "%{family}\n")/ { print a[NR-1]; exit }")"

	LOCK=()
	while read LINE
	do
	    if [[ "$LINE" =~ ([0-9]+)x([0-9]+)\+([0-9]+)\+([0-9]+) ]]; then
	        W=${BASH_REMATCH[1]}
	        H=${BASH_REMATCH[2]}
	        Xoff=${BASH_REMATCH[3]}
	        Yoff=${BASH_REMATCH[4]}
	        MIDXi=$((W / 2 + Xoff - 500  / 2))
	        MIDYi=$((H / 2 + Yoff - 500  / 2))
	        MIDXt=$((W / 2 + Xoff - 285 / 2))
	        MIDYt=$((H / 2 + Yoff + 320 / 2))
	        LOCK+=(-font $FONT -pointsize 26 -fill lightgrey -stroke grey10 \
	               -strokewidth 2 -annotate +$MIDXt+$MIDYt "$TEXT" \
	               -fill lightgrey -stroke lightgrey -strokewidth 1 -annotate +$MIDXt+$MIDYt "$TEXT" \
	               $ICON -geometry +$MIDXi+$MIDYi -composite)
	    fi
	done <<<"$(xrandr)"
	convert "$image" "${LOCK[@]}" "$image"
}

function prepare() {
	if [ ! "$lockscreen" = "keep" ] && [ ! "$lockscreen" = "blurred" ]
	then
	    # we requested an Picture Background: update background lockscreen
	    setbg lock "$lockscreen"
		#annotate_lockscreen ${lockscreen_image}
	elif [ "$lockscreen" = "blurred" ]
	then
		make_blurred
		annotate_lockscreen ${lockscreen_image}
	fi
	PLAYERCTLSTATUS="$(playerctl status ||:)"
}

function setpid() {
	PID=${1:-1}
	echo $PID >"${PIDFILE}"
	echo lock started with pid $PID
}

function delpid() {
	rm -fv "${PIDFILE}"
}

function pre_lock() {
	setpid

	# make sure music stops
	if [ "${PLAYERCTLSTATUS}" = "Playing" ]
	then
		playerctl stop
	fi

	# make sure presentation mode is off
	# presentation-mode stop

	# pause notifications (sleep because seems too soon after pres mode stop)
	(sleep 1; killall -v -SIGUSR1 dunst) & # pause

	# lock remote irssi screen
	# irc lock
}

function post_lock() {
    # re-enable notifications when unlock happens
    killall -v -SIGUSR2 dunst

	# re-renable music if it was playing
	if [ "${PLAYERCTLSTATUS}" = "Playing" ]
	then
		playerctl play
	fi

	delpid
}

function perform_lock() {
	pre_lock

	# perform the lock and exit this script
	# see etc/root/etc/systemd/system/i3lock.service where this lock is called 'forking'
    # lock screen with a background picture
    # --nofork makes sure i3lock doesn't return until it gets unlocked
    # i3lock --show-failed-attempts --tiling --nofork --ignore-empty-password --image ~/.lockscreen.png &
    betterlockscreen -l
	setpid $!
	wait

	# post lock to be run after screen is unlocked
	post_lock
}

function main() {
	prepare
	perform_lock &  # goes to background as this script needs to end and handover to systemd (in case called as part of suspend)
	# add in a bit to make sure the screen is locked before we handover to systemd suspend
	sleep 1
	}

main

