#!/bin/bash

# Separator between volume and battery
sketchybar --add item battery_separator right \
           --set battery_separator icon="︳" \
                                  icon.color=0x80ffffff \
                                  icon.font="Menlo:Bold:15.0" \
                                  icon.padding_left=0 \
                                  icon.padding_right=0 \
                                  label.drawing=off \
                                  background.drawing=off \
                                  padding_left=8 \
                                  padding_right=8
