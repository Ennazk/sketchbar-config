#!/bin/bash

sketchybar --add item dnd right \
           --set dnd update_freq=5 \
                     icon=􀆺 \
                     icon.color=0xffffffff \
                     label.drawing=off \
                     background.drawing=off \
                     drawing=off \
                     script="$PLUGIN_DIR/dnd.sh" \
           --subscribe dnd system_woke
