#!/usr/bin/env bash


# actually reload bar
if [[ $(pgrep -x polybar) ]]; then
    # polybar is already running, kill it!
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -x polybar >/dev/null; do sleep 1; done
else
    # polybar is not yet running, start it up
    polybar main &
    nm-applet &
fi
