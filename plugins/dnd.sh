#!/bin/bash

# Only show DND icon when actually in focus mode
# Hide it completely when not in DND

# Try to detect if DND/Focus is actually active
DND_ACTIVE=false

# Method 1: Check Focus modes via shortcuts (more reliable)
if command -v shortcuts &> /dev/null; then
    # This will only work if user has set up a shortcut to check focus status
    FOCUS_CHECK=$(osascript -e 'tell application "System Events" to get the name of every process whose name contains "Focus"' 2>/dev/null)
    if [[ -n "$FOCUS_CHECK" ]]; then
        DND_ACTIVE=true
    fi
fi

# Method 2: Check system DND database (fallback)
if [ "$DND_ACTIVE" = false ]; then
    if [ -f ~/Library/DoNotDisturb/DB/Assertions.json ]; then
        # Check if there are active assertions
        ASSERTIONS=$(cat ~/Library/DoNotDisturb/DB/Assertions.json 2>/dev/null | jq -r '.data[0].storeAssertionRecords | length' 2>/dev/null || echo "0")
        if [ "$ASSERTIONS" -gt 0 ] 2>/dev/null; then
            DND_ACTIVE=true
        fi
    fi
fi

# Only show the icon when DND is actually active
if [ "$DND_ACTIVE" = true ]; then
    sketchybar --set $NAME drawing=on icon.color=0xffffffff
else
    sketchybar --set $NAME drawing=off
fi
