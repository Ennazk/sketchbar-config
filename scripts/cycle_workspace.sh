#!/bin/bash

# Get current focused workspace
current=$(aerospace list-workspaces --focused)

# Define the workspace order
workspaces=("A" "S" "D" "F" "G")

# Find current workspace index
current_index=-1
for i in "${!workspaces[@]}"; do
    if [[ "${workspaces[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

# Determine direction (forward or backward)
direction="$1"

if [[ "$direction" == "next" ]]; then
    # Move to next workspace
    if [[ $current_index -eq -1 ]] || [[ $current_index -eq 4 ]]; then
        # If not found or at last workspace, go to first
        aerospace workspace A
    else
        # Go to next workspace
        next_index=$((current_index + 1))
        aerospace workspace "${workspaces[$next_index]}"
    fi
elif [[ "$direction" == "prev" ]]; then
    # Move to previous workspace
    if [[ $current_index -eq -1 ]] || [[ $current_index -eq 0 ]]; then
        # If not found or at first workspace, go to last
        aerospace workspace G
    else
        # Go to previous workspace
        prev_index=$((current_index - 1))
        aerospace workspace "${workspaces[$prev_index]}"
    fi
fi
