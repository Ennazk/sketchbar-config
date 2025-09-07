#!/bin/bash

# Separator between times and DND
sketchybar --add item dnd_separator right \
           --set dnd_separator icon="|" \
                              icon.color=0x40ffffff \
                              icon.font="SF Mono:Regular:12.0" \
                              label.drawing=off \
                              background.drawing=off \
                              padding_left=8 \
                              padding_right=8
