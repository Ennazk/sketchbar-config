#!/bin/bash

sketchybar --add item separator_left left \
           --set separator_left icon="│" \
                               icon.color=$SUBTLE \
                               icon.font="JetBrainsMono Nerd Font:Regular:14.0" \
                               label.drawing=off \
                               background.drawing=off \
                               icon.padding_left=4 \
                               icon.padding_right=4 \
                               padding_left=2 \
                               padding_right=2
