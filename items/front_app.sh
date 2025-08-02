#!/bin/bash

sketchybar --add item front_app left \
           --set front_app background.drawing=off \
                            icon.color=0xffffffff \
                            icon.font="sketchybar-app-font:Regular:16.0" \
                            label.color=0xffffffff \
                            label.font="SF Pro:Semibold:13.0" \
                            script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched