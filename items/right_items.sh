#!/bin/bash

# Combined right-side items with consistent styling and spacing

# Calendar (date and times)
sketchybar --add item calendar right \
           --set calendar icon.drawing=off \
                          label.color=0xffffffff \
                          background.drawing=off \
                          update_freq=1 \
                          padding_left=0 \
                          padding_right=0 \
                          script="$PLUGIN_DIR/calendar.sh"

# Separator 1 (between calendar and volume)
sketchybar --add item sep1 right \
           --set sep1 icon="︳" \
                       icon.color=0xffffffff \
                       icon.font="Menlo:Bold:15.0" \
                       label.drawing=off \
                       background.drawing=off \
                       padding_left=0 \
                       padding_right=12

# Volume
sketchybar --add item volume right \
           --set volume icon.color=0xffffffff \
                        label.color=0xffffffff \
                        label.font="SF Mono:Semibold:15.0" \
                        padding_left=0 \
                        padding_right=4 \
                        background.drawing=off \
                        script="$PLUGIN_DIR/volume.sh" \
                        update_freq=2 \
           --subscribe volume volume_change

# Separator 2 (between volume and battery)
sketchybar --add item sep2 right \
           --set sep2 icon="︳" \
                       icon.color=0xffffffff \
                       icon.font="Menlo:Bold:15.0" \
                       label.drawing=off \
                       background.drawing=off \
                       padding_left=0 \
                       padding_right=12

# Battery
sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.color=0xffffffff \
                         label.color=0xffffffff \
                         label.font="SF Mono:Semibold:15.0" \
                         label.width=0 \
                         padding_left=0 \
                       	 padding_right=10 \
                         background.drawing=off \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

# DND Separator (only visible when DND is active)
sketchybar --add item dnd_sep right \
           --set dnd_sep icon="︳" \
                         icon.color=0xffffffff \
                         icon.font="Menlo:Bold:15.0" \
                         label.drawing=off \
                         background.drawing=off \
                         padding_left=8 \
                         padding_right=12 \
                         drawing=off

# DND
sketchybar --add item dnd right \
           --set dnd icon="􀆺" \
                     icon.color=0xffffffff \
                     label.drawing=off \
                     label.color=0xffffffff \
                     label.font="SF Mono:Semibold:15.0" \
                     padding_left=0 \
                     padding_right=0 \
                     background.drawing=off \
                     script="$PLUGIN_DIR/dnd.sh" \
                     update_freq=5 \
           --subscribe dnd front_app_switched