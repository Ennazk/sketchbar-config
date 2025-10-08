#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon.drawing=off \
                          label.color=0xffffffff \
                          background.drawing=off \
                          update_freq=1 \
                          padding_left=5 \
                          script="$PLUGIN_DIR/calendar.sh"
