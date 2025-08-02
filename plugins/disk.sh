#!/bin/bash

# Get disk usage for root filesystem
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Update the item
sketchybar --set $NAME label="${DISK_USAGE}%"
