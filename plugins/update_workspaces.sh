#!/bin/bash

# Update all aerospace workspaces based on current focused workspace
FOCUSED=$(aerospace list-workspaces --focused)

for workspace in $(aerospace list-workspaces --all); do
    FOCUSED_WORKSPACE=$FOCUSED CONFIG_DIR=~/.config/sketchybar NAME=space.$workspace ~/.config/sketchybar/plugins/aerospace.sh $workspace
done
