#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.color=0xffffffff \
                         label.color=0xffffffff \
                         label.font="SF Mono:Semibold:15.0" \
                         label.width=50 \
                         padding_left=0 \
                         padding_right=0 \
                         background.drawing=off \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
