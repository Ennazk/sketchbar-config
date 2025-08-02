#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.color=0xffffffff \
                         label.color=0xffffffff \
                         background.drawing=off \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
