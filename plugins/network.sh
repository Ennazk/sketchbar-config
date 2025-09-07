#!/bin/bash

# Cache file to store previous values
CACHE_FILE="/tmp/sketchybar_network_cache"

# Get network interface (usually en0 for WiFi, en1 for ethernet)
interface=$(route get default | grep interface | awk '{print $2}')

# If no default route, try common interfaces
if [ -z "$interface" ]; then
    if ifconfig en0 | grep -q "status: active"; then
        interface="en0"
    elif ifconfig en1 | grep -q "status: active"; then
        interface="en1"
    else
        # No active interface found
        sketchybar --set $NAME label="No Connection"
        exit 0
    fi
fi

# Get current network statistics
stats=$(netstat -ibn | grep $interface | head -1)

if [ -n "$stats" ]; then
    # Extract current bytes in and out
    current_bytes_in=$(echo $stats | awk '{print $7}')
    current_bytes_out=$(echo $stats | awk '{print $10}')
    current_time=$(date +%s)
    
    # Read previous values from cache
    if [ -f "$CACHE_FILE" ]; then
        previous_data=$(cat "$CACHE_FILE")
        prev_bytes_in=$(echo $previous_data | awk '{print $1}')
        prev_bytes_out=$(echo $previous_data | awk '{print $2}')
        prev_time=$(echo $previous_data | awk '{print $3}')
        
        # Calculate time difference
        time_diff=$((current_time - prev_time))
        
        if [ $time_diff -gt 0 ]; then
            # Calculate bytes transferred in this interval
            bytes_in_diff=$((current_bytes_in - prev_bytes_in))
            bytes_out_diff=$((current_bytes_out - prev_bytes_out))
            
            # Calculate speed per second
            speed_in=$((bytes_in_diff / time_diff))
            speed_out=$((bytes_out_diff / time_diff))
            
            # Convert to human readable format with fixed width
            format_speed() {
                local bytes=$1
                if [ $bytes -ge 1048576 ]; then
                    printf "%4.1fMB/s" "$(echo "scale=1; $bytes/1048576" | bc)"
                elif [ $bytes -ge 1024 ]; then
                    printf "%4.1fKB/s" "$(echo "scale=1; $bytes/1024" | bc)"
                else
                    printf "%4.0fB/s" "$bytes"
                fi
            }
            
            down_speed=$(format_speed $speed_in)
            up_speed=$(format_speed $speed_out)
            
            # Update sketchybar with fixed-width format
            sketchybar --set $NAME label="↓$down_speed ↑$up_speed"
        else
            sketchybar --set $NAME label="↓0.0B/s ↑0.0B/s"
        fi
    else
        # First run, just show 0
        sketchybar --set $NAME label="↓0.0B/s ↑0.0B/s"
    fi
    
    # Save current values to cache
    echo "$current_bytes_in $current_bytes_out $current_time" > "$CACHE_FILE"
else
    sketchybar --set $NAME label="No Data"
fi
