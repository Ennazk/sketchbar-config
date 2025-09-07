#!/bin/bash

# Add single separator between times
sketchybar --add item time_separator right \
           --set time_separator icon="|" \
                               icon.color=0x40ffffff \
                               icon.font="SF Mono:Regular:12.0" \
                               label.drawing=off \
                               background.drawing=off \
                               padding_left=8 \
                               padding_right=8

# Add separator before DND
sketchybar --add item separator1 right \
           --set separator1 icon="|" \
                           icon.color=0x40ffffff \
                           icon.font="SF Mono:Regular:12.0" \
                           label.drawing=off \
                           background.drawing=off \
                           padding_left=3 \
                           padding_right=3

# Add separator before battery  
sketchybar --add item separator2 right \
           --set separator2 icon="|" \
                           icon.color=0x40ffffff \
                           icon.font="SF Mono:Regular:12.0" \
                           label.drawing=off \
                           background.drawing=off \
                           padding_left=3 \
                           padding_right=3

# Add separator before volume
sketchybar --add item separator3 right \
           --set separator3 icon="|" \
                           icon.color=0x40ffffff \
                           icon.font="SF Mono:Regular:12.0" \
                           label.drawing=off \
                           background.drawing=off \
                           padding_left=3 \
                           padding_right=3
