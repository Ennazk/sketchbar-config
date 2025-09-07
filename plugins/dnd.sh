#!/bin/bash

# More responsive DND detection using Control Center Focus Modes
DND_VISIBLE=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes" 2>/dev/null || echo "0")

if [ "$DND_VISIBLE" = "1" ]; then
    # Focus modes are enabled in Control Center
    # Try to detect if a focus mode is currently active
    
    # Method 1: Check if there's an active focus mode by looking at notification center prefs
    FOCUS_ACTIVE=$(defaults read com.apple.ncprefs dnd_prefs 2>/dev/null | grep -q "userPref" && echo "1" || echo "0")
    
    # Method 2: Alternative check using plutil (more reliable)
    if [ "$FOCUS_ACTIVE" = "0" ]; then
        DND_PREFS=$(plutil -extract dnd_prefs raw ~/Library/Preferences/com.apple.ncprefs.plist 2>/dev/null)
        if [ -n "$DND_PREFS" ] && [ "$DND_PREFS" != "" ]; then
            # Check if any focus setting indicates active state
            FOCUS_ACTIVE=$(echo "$DND_PREFS" | base64 -d | plutil -p - 2>/dev/null | grep -q '"dndDisplaySleep" => 1' && echo "1" || echo "0")
        fi
    fi
    
    # Update icon based on focus state
    if [ "$FOCUS_ACTIVE" = "1" ]; then
        # Focus mode is likely active - bright white
        sketchybar --set $NAME drawing=on icon.color=0xffffffff
    else
        # Focus modes enabled but not active - dimmed
        sketchybar --set $NAME drawing=on icon.color=0x50ffffff
    fi
else
    # Focus modes not enabled in Control Center - hide completely
    sketchybar --set $NAME drawing=off
fi