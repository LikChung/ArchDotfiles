#!/bin/bash

# Top processes script for waybar

echo "Top CPU:"
ps aux --sort=-%cpu | head -6 | tail -5 | awk '{printf "%-20s %6.1f%%\n", substr($11,1,20), $3}'

echo ""
echo "Top Memory:"
ps aux --sort=-%mem | head -6 | tail -5 | awk '{printf "%-20s %6.1f%%\n", substr($11,1,20), $4}'
