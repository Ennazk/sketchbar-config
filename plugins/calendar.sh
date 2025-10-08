#!/bin/bash

# Get date in format "Sat Sept 6"
DATE_FORMATTED=$(date "+%a %b %e" | sed 's/  / /' | sed 's/Sep/Sept/')

# Get local time with seconds (no timezone)
TIME=$(date "+%I:%M:%S %p")

# Get EST time with seconds and timezone
EST_TIME=$(TZ="America/New_York" date "+%I:%M:%S %p EST")

# Use a smaller/thinner separator that looks good at larger font size
SEPARATOR="·"

sketchybar --set $NAME label="$DATE_FORMATTED $SEPARATOR $EST_TIME $SEPARATOR $TIME"
