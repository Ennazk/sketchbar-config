#!/bin/bash

# Right-side items — clean, monochrome, JetBrains Mono Nerd Font

SEP_COLOR=$SUBTLE
FONT="JetBrainsMono Nerd Font"

# Local Time
sketchybar --add item local_time right \
           --set local_time icon.drawing=off \
                            label.color=$WHITE \
                            label.font="$FONT:Bold:15.0" \
                            background.drawing=off \
                            update_freq=1 \
                            padding_left=0 \
                            padding_right=6 \
                            script="$PLUGIN_DIR/local_time.sh"

# Separator 1
sketchybar --add item sep1 right \
           --set sep1 icon="│" \
                       icon.color=$SEP_COLOR \
                       icon.font="$FONT:Regular:10.0" \
                       label.drawing=off \
                       background.drawing=off \
                       padding_left=4 \
                       padding_right=4

# EST Time
sketchybar --add item est_time right \
           --set est_time icon.drawing=off \
                          label.color=$WHITE \
                          label.font="$FONT:Bold:15.0" \
                          background.drawing=off \
                          update_freq=1 \
                          padding_left=0 \
                          padding_right=0 \
                          script="$PLUGIN_DIR/est_time.sh"

# Separator
sketchybar --add item time_sep right \
           --set time_sep icon="│" \
                          icon.color=$SEP_COLOR \
                          icon.font="$FONT:Regular:10.0" \
                          label.drawing=off \
                          background.drawing=off \
                          padding_left=4 \
                          padding_right=4

# Date
sketchybar --add item date right \
           --set date icon.drawing=off \
                      label.color=$WHITE \
                      label.font="$FONT:Bold:15.0" \
                      background.drawing=off \
                      update_freq=1 \
                      padding_left=0 \
                      padding_right=0 \
                      script="$PLUGIN_DIR/date.sh"

# Separator
sketchybar --add item date_sep right \
           --set date_sep icon="│" \
                          icon.color=$SEP_COLOR \
                          icon.font="$FONT:Regular:10.0" \
                          label.drawing=off \
                          background.drawing=off \
                          padding_left=4 \
                          padding_right=4

# Volume
sketchybar --add item volume right \
           --set volume icon.color=$WHITE \
                        icon.font="$FONT:Bold:15.0" \
                        label.color=$WHITE \
                        label.font="$FONT:Bold:15.0" \
                        padding_left=0 \
                        padding_right=2 \
                        background.drawing=off \
                        script="$PLUGIN_DIR/volume.sh" \
                        update_freq=2 \
           --subscribe volume volume_change

# Separator
sketchybar --add item sep2 right \
           --set sep2 icon="│" \
                       icon.color=$SEP_COLOR \
                       icon.font="$FONT:Regular:10.0" \
                       label.drawing=off \
                       background.drawing=off \
                       padding_left=4 \
                       padding_right=4

# Battery
sketchybar --add item battery right \
           --set battery update_freq=120 \
                         icon.color=$WHITE \
                         icon.font="$FONT:Bold:15.0" \
                         label.color=$WHITE \
                         label.font="$FONT:Bold:15.0" \
                         label.width=40 \
                         padding_left=0 \
                         padding_right=6 \
                         background.drawing=off \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change

# DND Separator
sketchybar --add item dnd_sep right \
           --set dnd_sep icon="│" \
                         icon.color=$SEP_COLOR \
                         icon.font="$FONT:Regular:10.0" \
                         label.drawing=off \
                         background.drawing=off \
                         padding_left=4 \
                         padding_right=4 \
                         drawing=off

# DND
sketchybar --add item dnd right \
           --set dnd icon="􀆺" \
                     icon.color=$WHITE \
                     icon.font="$FONT:Bold:15.0" \
                     label.drawing=off \
                     label.color=$WHITE \
                     label.font="$FONT:Bold:15.0" \
                     padding_left=0 \
                     padding_right=0 \
                     background.drawing=off \
                     script="$PLUGIN_DIR/dnd.sh" \
                     update_freq=5 \
           --subscribe dnd front_app_switched

# CPU Separator
sketchybar --add item cpu_sep right \
           --set cpu_sep icon="│" \
                         icon.color=$SEP_COLOR \
                         icon.font="$FONT:Regular:10.0" \
                         label.drawing=off \
                         background.drawing=off \
                         padding_left=4 \
                         padding_right=4

# CPU Monitor
sketchybar --add item cpu right \
           --set cpu icon="􀧓" \
                     icon.color=$WHITE \
                     icon.font="$FONT:Bold:15.0" \
                     icon.padding_right=4 \
                     label.color=$WHITE \
                     label.font="$FONT:Bold:15.0" \
                     padding_left=0 \
                     padding_right=2 \
                     background.drawing=off \
                     script="$PLUGIN_DIR/cpu.sh" \
                     update_freq=2

# RAM Separator
sketchybar --add item ram_sep right \
           --set ram_sep icon="│" \
                         icon.color=$SEP_COLOR \
                         icon.font="$FONT:Regular:10.0" \
                         label.drawing=off \
                         background.drawing=off \
                         padding_left=4 \
                         padding_right=4

# RAM Monitor
sketchybar --add item ram right \
           --set ram icon="􀫦" \
                     icon.color=$WHITE \
                     icon.font="$FONT:Bold:15.0" \
                     icon.padding_right=4 \
                     label.color=$WHITE \
                     label.font="$FONT:Bold:15.0" \
                     padding_left=0 \
                     padding_right=2 \
                     background.drawing=off \
                     script="$PLUGIN_DIR/ram.sh" \
                     update_freq=5 \
           --subscribe ram system_woke

# Disk Separator
sketchybar --add item disk_sep right \
           --set disk_sep icon="│" \
                          icon.color=$SEP_COLOR \
                          icon.font="$FONT:Regular:10.0" \
                          label.drawing=off \
                          background.drawing=off \
                          padding_left=4 \
                          padding_right=4

# Disk Monitor
sketchybar --add item disk right \
           --set disk icon="􀤂" \
                      icon.color=$WHITE \
                      icon.font="$FONT:Bold:15.0" \
                      icon.padding_right=4 \
                      label.color=$WHITE \
                      label.font="$FONT:Bold:15.0" \
                      padding_left=0 \
                      padding_right=2 \
                      background.drawing=off \
                      script="$PLUGIN_DIR/disk.sh" \
                      update_freq=60 \
           --subscribe disk system_woke
