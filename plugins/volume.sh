#!/bin/bash

# Get volume level
if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO
else
  VOLUME=$(osascript -e "output volume of (get volume settings)" 2>/dev/null)
fi

if [ "$VOLUME" = "" ] || [ "$VOLUME" = "missing value" ]; then
  sketchybar --set $NAME drawing=off
  exit 0
fi

# Show the item
sketchybar --set $NAME drawing=on

# Use reliable SF Pro volume symbols
case $VOLUME in
  [8-9][0-9]|100) ICON="􀊩" ;;  # speaker.wave.3.fill
  [5-7][0-9]) ICON="􀊧" ;;      # speaker.wave.2.fill
  [2-4][0-9]) ICON="􀊥" ;;      # speaker.wave.1.fill
  [1-9]) ICON="􀊡" ;;           # speaker.1.fill
  *) ICON="􀊣" ;;               # speaker.slash.fill
esac

sketchybar --set $NAME icon="$ICON" label=""
