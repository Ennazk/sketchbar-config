#!/bin/bash

# Get date in format "Sat Sept 6"
DATE_FORMATTED=$(date "+%a %b %e" | sed 's/  / /' | sed 's/Sep/Sept/')

# Get local time with seconds, timezone, and leading zeros
TIME=$(date "+%I:%M:%S %p %Z")

# Get EST time with seconds and timezone
EST_TIME=$(TZ="America/New_York" date "+%I:%M:%S %p EST")

# Use thin vertical bar without extra spaces (padding handled by icon separators)
SEPARATOR="｜"

sketchybar --set $NAME label="$DATE_FORMATTED $SEPARATOR $TIME $SEPARATOR $EST_TIME"
