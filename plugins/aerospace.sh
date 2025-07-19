#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Get the currently focused workspace
CURRENT_FOCUSED=$(aerospace list-workspaces --focused)

if [ "$1" = "$CURRENT_FOCUSED" ]; then
    sketchybar --set $NAME background.drawing=on \
                           background.color=$ACCENT_COLOR \
                           icon.color=$BAR_COLOR \
                           label.color=$BAR_COLOR
else
    sketchybar --set $NAME background.drawing=off \
                           icon.color=$ACCENT_COLOR \
                           label.color=$ACCENT_COLOR
fi
