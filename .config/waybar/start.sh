#!/bin/bash

# Waybar launcher script for Enif theme
# Usage: ./start.sh

# Kill existing waybar instances
killall waybar 2>/dev/null
sleep 1

# Launch waybar with the Enif config
waybar -c $HOME/.config/waybar/config.jsonc -s $HOME/.config/waybar/style.css &

echo "Waybar started with Enif theme"
exit 0
