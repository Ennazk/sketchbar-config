#!/bin/bash

sketchybar --add item volume right \
           --set volume icon.color=0xffffffff \
                        label.color=0xffffffff \
                        background.drawing=off \
                        script="$PLUGIN_DIR/volume.sh" \
                        update_freq=2 \
           --subscribe volume volume_change
