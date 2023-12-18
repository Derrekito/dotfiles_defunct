#!/bin/bash
WALLPAPERS="$HOME/wallpapers"
RANDOM_WALLPAPER=$(find "$WALLPAPERS" -type f | shuf -n 1)
feh --bg-scale "$RANDOM_WALLPAPER"

