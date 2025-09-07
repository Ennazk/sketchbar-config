#!/bin/bash

sketchybar --add item dnd right \
           --set dnd update_freq=2 \
                     icon=􀆺 \
                     icon.color=0x50ffffff \
                     label.drawing=off \
                     background.drawing=off \
                     drawing=on \
                     script="$PLUGIN_DIR/dnd.sh" \
           --subscribe dnd system_woke front_app_switched
