#!/bin/bash

# Get aerospace workspaces dynamically
SPACE_SIDS=($(aerospace list-workspaces --all))

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              icon.color=$ACCENT_COLOR                   \
                              icon.highlight_color=$BAR_COLOR            \
                              label.drawing=off                          \
                              background.color=$ACCENT_COLOR             \
                              background.corner_radius=5                 \
                              background.height=24                       \
                              background.drawing=off                     \
                              script="$PLUGIN_DIR/aerospace.sh $sid"     \
                              update_freq=2                              \
             --subscribe space.$sid aerospace_workspace_change
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$ACCENT_COLOR               \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off
