#!/bin/bash

# Get memory information
MEMORY_PRESSURE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print $5}' | sed 's/%//')
if [ -z "$MEMORY_PRESSURE" ]; then
    # Fallback method using vm_stat
    VM_STAT=$(vm_stat)
    
    # Extract values (pages)
    PAGES_FREE=$(echo "$VM_STAT" | grep "Pages free:" | awk '{print $3}' | sed 's/\.//')
    PAGES_ACTIVE=$(echo "$VM_STAT" | grep "Pages active:" | awk '{print $3}' | sed 's/\.//')
    PAGES_INACTIVE=$(echo "$VM_STAT" | grep "Pages inactive:" | awk '{print $3}' | sed 's/\.//')
    PAGES_SPECULATIVE=$(echo "$VM_STAT" | grep "Pages speculative:" | awk '{print $3}' | sed 's/\.//')
    PAGES_WIRED=$(echo "$VM_STAT" | grep "Pages wired down:" | awk '{print $4}' | sed 's/\.//')
    PAGES_COMPRESSED=$(echo "$VM_STAT" | grep "Pages stored in compressor:" | awk '{print $5}' | sed 's/\.//')
    
    # Calculate total and used memory (page size is typically 4096 bytes)
    PAGE_SIZE=4096
    TOTAL_PAGES=$((PAGES_FREE + PAGES_ACTIVE + PAGES_INACTIVE + PAGES_SPECULATIVE + PAGES_WIRED + PAGES_COMPRESSED))
    USED_PAGES=$((PAGES_ACTIVE + PAGES_INACTIVE + PAGES_SPECULATIVE + PAGES_WIRED + PAGES_COMPRESSED))
    
    if [ $TOTAL_PAGES -gt 0 ]; then
        RAM_PERCENTAGE=$((USED_PAGES * 100 / TOTAL_PAGES))
    else
        RAM_PERCENTAGE=0
    fi
else
    RAM_PERCENTAGE=$((100 - MEMORY_PRESSURE))
fi

# Update the item
sketchybar --set $NAME label="$(printf "%3s%%" "$RAM_PERCENTAGE")"
