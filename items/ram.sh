#!/bin/bash

sketchybar --add item ram right \
           --set ram update_freq=5 \
                     icon=􀫦 \
                     icon.color=0xffffffff \
                     label.color=0xffffffff \
                     background.drawing=off \
                     script="$PLUGIN_DIR/ram.sh" \
           --subscribe ram system_woke
