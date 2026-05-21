#!/bin/bash

# Waybar Enif Theme - Module Test Display
# Shows what each module will display

# Get the actual script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/scripts" && pwd)"

echo "=========================================="
echo "  Waybar Enif Theme - Module Preview"
echo "=========================================="
echo ""

echo "📅 Time Module:"
echo "   $(date '+%I:%M %p')"
echo ""

echo "📆 Date Module:"
echo "   $(date '+%A')"
echo "   $(date '+%b %d, %Y')"
echo ""

echo "👋 Greeting Module:"
bash "$SCRIPT_DIR/greeting.sh" | sed 's/^/   /'
echo ""

echo "🌡️  Weather Module:"
bash "$SCRIPT_DIR/weather-main.sh" | sed 's/^/   /'
echo ""

echo "📡 Network Stats:"
bash "$SCRIPT_DIR/network-stats.sh" | sed 's/^/   /'
echo ""

echo "💻 CPU/Memory/Process Stats:"
echo "---"
bash "$SCRIPT_DIR/process-top.sh" | sed 's/^/   /'
echo ""

echo "=========================================="
echo "✅ All modules are working!"
echo ""
echo "To start waybar, run:"
echo "  ~/.config/waybar/start.sh"
echo ""
echo "Or manually:"
echo "  waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &"
echo "=========================================="
