#!/bin/bash

HOST="$(xrandr | grep eDP | awk '{print $1}')"
#EXTERN="$(xrandr | grep -v disconnected | grep connected | grep -v $HOST | awk '{print $1}')"
EXTERN="$(xrandr | grep HDMI | grep -v $HOST | awk '{print $1}')"

LOCATION="$1"

if [ "$LOCATION" == "home" ]; then
    echo "setting home monitor setup"

    LEFT='HDMI-0'
    RIGHT='$HOST'

    xrandr --output $LEFT --auto
    xrandr --output $RIGHT --off
fi

if [ "$LOCATION" == "work" ]; then
    echo "setting work monitor setup"

    xrandr --output $EXTERN --auto
    xrandr --output $HOST --off
fi

# change to rm number
if [ "$LOCATION" == "bigconf" ]; then
    echo "setting big conference room monitor setup"
    LEFT='HDMI-1-0'
    RIGHT='$HOST'
    xrandr --output $EXTERN --auto
#    xrandr --output $HOST --off
fi

if [ "$LOCATION" == "lilconf" ]; then
    echo "setting little conference room monitor setup"
    LEFT='HDMI-0'
    RIGHT='$HOST'
fi

if [ "$LOCATION" == "reset" ]; then
    echo "setting to default monitor setup"
    xrandr --output $HOST --auto

    # Turn off all other monitors
    for monitor in $(xrandr | grep ' connected' | awk '{print $1}'); do
        if [ "$monitor" != "$HOST" ]; then
            xrandr --output $monitor --off
        fi
    done
fi

if [ "$LOCATION" == "" ]; then
    echo "enter arg 'work', 'home', 'bigconf', 'lilconf', 'reset'"
    exit 1
fi

xset s off
xset -dpms
