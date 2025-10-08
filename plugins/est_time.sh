#!/bin/bash

# Get EST time with seconds and timezone
EST_TIME=$(TZ="America/New_York" date "+%I:%M:%S %p EST")

sketchybar --set $NAME label="$EST_TIME"