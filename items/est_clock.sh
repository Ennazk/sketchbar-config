#!/bin/bash

sketchybar --add item est_clock right \
           --set est_clock update_freq=1 \
                          icon.drawing=off \
                          label.color=0xffffffff \
                          label.font="SF Mono:Bold:15.0" \
                          background.drawing=off \
                          script="$PLUGIN_DIR/calendar.sh" \
                          padding_left=5
