#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
polybar-msg cmd quit

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/mybar.log /tmp/tray.log
echo "---" | tee -a /tmp/mybar.log
polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown
#polybar tray 2>&1 | tee -a /tmp/tray.log & disown

echo "Polybars launched..."

