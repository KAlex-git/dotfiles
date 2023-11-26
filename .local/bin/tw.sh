#!/usr/bin/sh
#
#
myTime=$(date +"My current time:  %r")
moscowtime=$(TZ="Europe/Moscow" date +"time a Moscow:  %r")

echo $myTime

echo $moscowtime
