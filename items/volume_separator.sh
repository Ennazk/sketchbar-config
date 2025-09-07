#!/bin/bash

# Separator between calendar and volume
sketchybar --add item volume_separator right \
           --set volume_separator icon="｜" \
                                 icon.color=0x80ffffff \
                                 icon.font="Menlo:Bold:15.0" \
                                 icon.padding_left=0 \
                                 icon.padding_right=0 \
                                 label.drawing=off \
                                 background.drawing=off \
                                 padding_left=0 \
                                 padding_right=0
