#!/bin/bash

WALLPAPER_PATH="$HOME/wallpaper"

# Get the resolution of the active display
RESOLUTION=$(xrandr --current | grep '*' | uniq | awk '{print $1}')
WIDTH=$(echo $RESOLUTION | cut -d 'x' -f1)
HEIGHT=$(echo $RESOLUTION | cut -d 'x' -f2)

# Calculate aspect ratio
ASPECT_RATIO=$(echo "scale=2; $WIDTH/$HEIGHT" | bc)

# Set the wallpaper directory based on aspect ratio
if (( $(echo "$ASPECT_RATIO == 1.77" | bc -l) )); then
    WALLPAPER_DIR="$WALLPAPER_PATH/16:9"
else
    WALLPAPER_DIR="$WALLPAPER_PATH/21:9"
fi

# Select a random wallpaper from the appropriate directory
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper
feh --bg-scale "$RANDOM_WALLPAPER"
