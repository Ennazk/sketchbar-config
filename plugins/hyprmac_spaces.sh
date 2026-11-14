#!/bin/bash
# Redraws HyprMac workspace items: focused = highlighted, occupied = shown, empty = hidden.
JQ=/opt/homebrew/bin/jq
SB=/opt/homebrew/bin/sketchybar
state=${HYPRMAC_STATE_FILE:-"$HOME/Library/Application Support/HyprMac/state.json"}

if [ ! -f "$state" ]; then   # HyprMac quit or paused: hide everything
  args=(); for ws in $(seq 1 10); do args+=(--set hspace.$ws drawing=off); done
  $SB "${args[@]}"; exit 0
fi

args=()
while IFS=$'\t' read -r id count visible focused; do
  if [ "$focused" = true ]; then
    args+=(--set hspace.$id drawing=on background.drawing=on icon.color=0xffffffff)
  elif [ "$visible" = true ] || [ "$count" -gt 0 ]; then
    args+=(--set hspace.$id drawing=on background.drawing=off icon.color=0xffe0e0e0)
  else
    args+=(--set hspace.$id drawing=off background.drawing=off)
  fi
done < <($JQ -r '.focusedWorkspace as $f | .workspaces[] | [.id, (.windows|length), .visible, (.id == $f)] | @tsv' "$state")
$SB "${args[@]}"
