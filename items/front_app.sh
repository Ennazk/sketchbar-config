#!/bin/bash

sketchybar --add item front_app left \
           --set front_app background.drawing=off \
                            icon.color=$WHITE \
                            icon.font="sketchybar-app-font:Regular:16.0" \
                            label.color=$WHITE \
                            label.font="JetBrainsMono Nerd Font:Bold:15.0" \
                            script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
