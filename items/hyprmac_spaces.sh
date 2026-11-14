#!/bin/bash
# HyprMac workspace numbers (fed by HyprMac's state.json + hyprmac_change event)

sketchybar --add event hyprmac_change

for ws in 1 2 3 4 5 6 7 8 9 10; do
  label=$ws; [ "$ws" = 10 ] && label=0
  sketchybar --add item hspace.$ws left \
             --set hspace.$ws icon="$label" \
                              icon.color=$DIM \
                              icon.padding_left=8 \
                              icon.padding_right=8 \
                              label.drawing=off \
                              padding_left=1 \
                              padding_right=1 \
                              background.color=0x40ffffff \
                              background.corner_radius=5 \
                              background.height=24 \
                              background.drawing=off \
                              drawing=off \
                              click_script="open -g 'hyprmac://focus?workspace=$ws'"
done

# One hidden controller updates all ten in a single pass
sketchybar --add item hspace.controller left \
           --set hspace.controller drawing=off \
                                   updates=on \
                                   script="$PLUGIN_DIR/hyprmac_spaces.sh" \
           --subscribe hspace.controller hyprmac_change system_woke
