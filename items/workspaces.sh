#!/bin/bash

# Add specific number workspaces only
for workspace in 1 2 3 4 5; do
  sketchybar --add item workspace.$workspace left \
             --set workspace.$workspace icon=$workspace \
                                        icon.color=$WHITE \
                                        icon.padding_left=8 \
                                        icon.padding_right=8 \
                                        padding_left=2 \
                                        padding_right=2 \
                                        label.drawing=off \
                                        background.color=0x40ffffff \
                                        background.corner_radius=5 \
                                        background.height=24 \
                                        background.drawing=off \
                                        script="$PLUGIN_DIR/workspace.sh $workspace" \
                                        update_freq=1 \
             --subscribe workspace.$workspace aerospace_workspace_change
done

# Add separator between workspaces and front app
sketchybar --add item separator left \
           --set separator icon="│" \
                           icon.color=0x40ffffff \
                           icon.padding_left=8 \
                           icon.padding_right=8 \
                           label.drawing=off \
                           background.drawing=off
