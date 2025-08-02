#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          icon.color=0xffffffff \
                          label.color=0xffffffff \
                          background.drawing=off \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
