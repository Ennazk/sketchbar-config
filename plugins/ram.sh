#!/bin/bash

PAGE_SIZE=$(sysctl -n hw.pagesize)
TOTAL_BYTES=$(sysctl -n hw.memsize)

# Used = active + wired + compressed (matches Activity Monitor's "Memory Used")
USED_PAGES=$(vm_stat | awk '
  /Pages active/                {gsub(/\./,"",$3); sum+=$3}
  /Pages wired down/            {gsub(/\./,"",$4); sum+=$4}
  /Pages occupied by compressor/{gsub(/\./,"",$5); sum+=$5}
  END {print sum}
')

RAM_PERCENT=$(awk "BEGIN {printf \"%.0f\", $USED_PAGES * $PAGE_SIZE * 100 / $TOTAL_BYTES}")

# Format with leading zero for consistent width
sketchybar --set $NAME label="$(printf "%02d%%" "$RAM_PERCENT")"
