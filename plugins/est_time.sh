#!/bin/bash

# Get New York time with seconds
NY_TIME=$(TZ="America/New_York" date "+%I:%M:%S %p NY")

sketchybar --set $NAME label="$NY_TIME"