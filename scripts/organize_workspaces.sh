#!/bin/bash

echo "Organizing apps into their designated workspaces..."

# Function to move app to workspace if it exists
move_app_to_workspace() {
    local app_name="$1"
    local workspace="$2"
    local window_count=$(aerospace list-windows --app "$app_name" 2>/dev/null | wc -l)
    
    if [ "$window_count" -gt 0 ]; then
        echo "Moving $app_name to workspace $workspace..."
        aerospace list-windows --app "$app_name" --format "%{window-id}" | while read -r window_id; do
            if [ -n "$window_id" ]; then
                aerospace move-node-to-workspace --window-id "$window_id" "$workspace"
            fi
        done
    else
        echo "$app_name not found or has no windows"
    fi
}

# Workspace 1: Main work apps
echo "=== Moving main work apps to workspace 1 ==="
move_app_to_workspace "Visual Studio Code" 1
move_app_to_workspace "Code" 1
move_app_to_workspace "Xcode" 1
move_app_to_workspace "Atom" 1
move_app_to_workspace "Sublime Text" 1
move_app_to_workspace "Terminal" 1
move_app_to_workspace "iTerm2" 1
move_app_to_workspace "Sequel Pro" 1
move_app_to_workspace "Sequel Ace" 1

# Workspace 2: Browser apps
echo "=== Moving browser apps to workspace 2 ==="
move_app_to_workspace "Arc" 2
move_app_to_workspace "Google Chrome" 2
move_app_to_workspace "Firefox" 2
move_app_to_workspace "Safari" 2

# Workspace 3: Communication apps
echo "=== Moving communication apps to workspace 3 ==="
move_app_to_workspace "Discord" 3
move_app_to_workspace "Messenger" 3
move_app_to_workspace "Slack" 3
move_app_to_workspace "Messages" 3
move_app_to_workspace "Signal" 3
move_app_to_workspace "Telegram" 3
move_app_to_workspace "WhatsApp" 3

# Workspace 4: Notes apps
echo "=== Moving notes apps to workspace 4 ==="
move_app_to_workspace "Notion" 4
move_app_to_workspace "Notes" 4
move_app_to_workspace "Bear" 4
move_app_to_workspace "Obsidian" 4

# Workspace 5: Music apps
echo "=== Moving music apps to workspace 5 ==="
move_app_to_workspace "YouTube Music" 5
move_app_to_workspace "Spotify" 5
move_app_to_workspace "Music" 5

echo "=== Workspace organization complete! ==="
echo "Apps have been moved to their designated workspaces:"
echo "Workspace 1: Development tools"
echo "Workspace 2: Browsers"
echo "Workspace 3: Communication"
echo "Workspace 4: Notes & Documentation"
echo "Workspace 5: Music & Media"
