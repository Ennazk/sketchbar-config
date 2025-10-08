#!/bin/bash

# Get local time with seconds (no timezone)
TIME=$(date "+%I:%M:%S %p")

sketchybar --set $NAME label="$TIME"