#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO
else
  widget
  VOLUME=$(osascript -e "output volume of (get volume settings)" 2>/dev/null)
  if [ "$VOLUME" = "missing value" ] || [ -z "$VOLUME" ]; then
    # Can't detect volume - hide the widget
    sketchybar --set $NAME drawing=off
    exit 0
  fi
fi

# Show the widget and update it
sketchybar --set $NAME drawing=on

case $VOLUME in
  [6-9][0-9]|100) ICON="􀊩"
  ;;
  [3-5][0-9]) ICON="􀊥"
  ;;
  [1-9]|[1-2][0-9]) ICON="􀊡"
  ;;
  *) ICON="􀊣"
esac

sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
