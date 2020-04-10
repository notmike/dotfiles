#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybars here
polybar -r -q barTop &
polybar -r -q barSecond &

# echo "Bars launched..."
