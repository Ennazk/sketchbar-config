#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      icon.color=0xffffffff \
                      label.color=0xffffffff \
                      background.drawing=off \
                      script="$PLUGIN_DIR/cpu.sh"
