#!/bin/bash

LEFT='HDMI-0'
RIGHT='eDP-1-1'
CENTER='DP-0'

#exec xrandr --output DP-1 --off
#exec xrandr --output eDP-1-1 --auto
#exec xrandr --output DP-0 --left-of eDP-1-1 --auto
#exec xrandr --output HDMI-0 --left-of DP-0 --auto

#xrandr --output $CENTER --auto
#xrandr --output $LEFT --auto
#xrandr --output $RIGHT --auto

#xrandr --output $LEFT --left-of $RIGHT --auto
#xrandr --output $RIGHT --right-of $LEFT --auto

xrandr --output $LEFT --auto
xrandr --output $RIGHT --off

xset s off
xset -dpms
