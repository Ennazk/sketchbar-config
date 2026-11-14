#!/bin/bash

FONT="JetBrainsMono Nerd Font"

sketchybar --add item media left \
           --set media icon=󰎈 \
                       icon.font="$FONT:Bold:15.0" \
                       icon.color=$WHITE \
                       label.font="$FONT:Bold:13.0" \
                       label.color=$WHITE \
                       label.max_chars=30 \
                       scroll_texts=on \
                       background.drawing=off \
                       drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
