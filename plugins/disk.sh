#!/bin/bash

# Data volume, not / — on APFS the sealed system volume reports a misleading number
DISK_PERCENT=$(df -H /System/Volumes/Data | awk 'NR==2 {gsub(/%/,"",$5); print $5}')

# Format with leading zero for consistent width
sketchybar --set $NAME label="$(printf "%02d%%" "$DISK_PERCENT")"
