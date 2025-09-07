#!/bin/bash

sketchybar --add item network right \
           --set network update_freq=1 \
                        script="$PLUGIN_DIR/network.sh" \
                        icon.drawing=off \
                        label.color=0xffffffff \
                        background.drawing=off \
                        padding_left=5
