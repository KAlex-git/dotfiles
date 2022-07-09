#!/usr/bin/env bash

# Script to start all Lux HUD conky widgets.
# As you can see below all conky processes gets killed
# first before running since this is a collection that takes
# up the whole desktop. Feel free to modify this for you needs.
# Author: Mikael Luxwarp Carlsson mikael.m.carlsson@gmail.com https://connumin.com
# License: ISC.

# Let the desktop load for a few seconds before running
sleep 5

# Kill all current conky processes.
killall conky

# Starting all lux-hud conky widgets.
conky -c ~/.config/conky/doom-dwm.conkyrc &
conky -c ~/.config/conky/cal.conf &
$conky -c ~/.config/conky/doom-dwm-clock.conf &
