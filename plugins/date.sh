#!/bin/bash

# Get date in format "Sat Sept 6"
DATE_FORMATTED=$(date "+%a %b %e" | sed 's/  / /' | sed 's/Sep/Sept/')

sketchybar --set $NAME label="$DATE_FORMATTED"