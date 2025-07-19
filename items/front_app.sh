#!/bin/bash

sketchybar --add item front_app left \
           --set front_app icon.font="sketchybar-app-font:Regular:16.0" \
                           icon.color=$WHITE \
                           label.color=$WHITE \
                           background.color=$ITEM_BG_COLOR \
                           background.corner_radius=5 \
                           background.height=24 \
                           script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched