#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Get the currently focused workspace
FOCUSED=$(aerospace list-workspaces --focused)

if [ "$1" = "$FOCUSED" ]; then
    # Highlighted state - black text on white background
    sketchybar --set $NAME background.drawing=on \
                           background.color=$WHITE \
                           icon.color=$BLACK
else
    # Normal state - white text on transparent background
    sketchybar --set $NAME background.drawing=off \
                           icon.color=$WHITE
fi
