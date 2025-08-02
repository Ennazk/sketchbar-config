#!/bin/bash

sketchybar --add item disk right \
           --set disk update_freq=30 \
                      icon=􀤂 \
                      icon.color=0xffffffff \
                      label.color=0xffffffff \
                      background.drawing=off \
                      script="$PLUGIN_DIR/disk.sh" \
           --subscribe disk system_woke
