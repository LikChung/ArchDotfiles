#!/bin/bash

# Network statistics script for waybar

# Get primary network interface
INTERFACE=$(find /sys/class/net -type l 2>/dev/null | head -n 1 | xargs basename)

# Fallback interfaces if not found
if [[ -z "$INTERFACE" ]]; then
    for iface in wlan0 eth0 ens160 enp0s3 enp1s0; do
        [[ -d "/sys/class/net/$iface" ]] && INTERFACE=$iface && break
    done
fi

# If still no interface, display message
if [[ -z "$INTERFACE" ]]; then
    echo "⚠ No network interface"
    exit 0
fi

# Function to get download speed
get_down_speed() {
    cat "/sys/class/net/${INTERFACE}/statistics/rx_bytes" 2>/dev/null || echo 0
}

# Function to get upload speed
get_up_speed() {
    cat "/sys/class/net/${INTERFACE}/statistics/tx_bytes" 2>/dev/null || echo 0
}

# Get current speeds
CURRENT_DOWN=$(get_down_speed)
CURRENT_UP=$(get_up_speed)

# Calculate differences
if [[ -f /tmp/waybar_net_stats ]]; then
    source /tmp/waybar_net_stats
    DOWN_DIFF=$((($CURRENT_DOWN - ${PREV_DOWN:-0}) / 1024))
    UP_DIFF=$((($CURRENT_UP - ${PREV_UP:-0}) / 1024))
else
    DOWN_DIFF=0
    UP_DIFF=0
fi

# Ensure non-negative values
[[ $DOWN_DIFF -lt 0 ]] && DOWN_DIFF=0
[[ $UP_DIFF -lt 0 ]] && UP_DIFF=0

# Save current values
cat > /tmp/waybar_net_stats << EOF
PREV_DOWN=$CURRENT_DOWN
PREV_UP=$CURRENT_UP
EOF

# Format output
echo "↓ ${DOWN_DIFF} KiB/s | ↑ ${UP_DIFF} KiB/s"
