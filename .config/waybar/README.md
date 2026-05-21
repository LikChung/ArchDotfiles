# Waybar Enif Theme - Wayland Version

This is a Wayland-native replacement for the original conky Enif theme. It provides the same functionality with better Wayland/Sway support.

## 📋 Features

### Main Panel (Top-Left)
- **Time Display**: Shows current time with AM/PM
- **Date Display**: Shows current day and date
- **Greeting**: Time-based greeting message
- **Weather Widget**: Current temperature, condition, and weather icon
- **Network Statistics**: Download/Upload speeds

### Process Panel (Bottom-Right)
- **CPU Monitor**: Real-time CPU usage with color coding
- **Memory Monitor**: Real-time memory usage percentage
- **Top Processes**: Lists top 5 CPU and memory consuming processes

## 🚀 Installation & Usage

### Prerequisites

```bash
# Install required packages on Fedora
rpm-ostree install waybar jq curl

# Optional but recommended: Weather icons font
rpm-ostree install weather-icons-fonts
```

### Setup

1. **Configuration is already in place** at `~/.config/waybar/`

2. **Start waybar**:
   ```bash
   ~/.config/waybar/start.sh
   ```

   Or directly:
   ```bash
   waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
   ```

3. **Add to Sway autostart** (if desired):
   ```bash
   # Add to ~/.config/sway/config
   exec $HOME/.config/waybar/start.sh
   ```

## 🎨 Customization

### Colors
Edit `style.css` to change colors. Current palette uses Flexoki theme:
- Primary accent: `#6cbfbf` (Cyan)
- Background: `#141b1e` (Dark)
- Text: `#dadada` (Light gray)

### Network Interface
If your network interface is not `ens160`, edit `scripts/network-stats.sh`:
```bash
INTERFACE="your-interface-name"  # e.g., eth0, wlan0, enp0s3
```

### Weather Location
Edit `scripts/weather-main.sh` and update:
```bash
lat=22.2855      # Your latitude
lon=114.1577     # Your longitude
api_key=YOUR_KEY # Get free API key from openweathermap.org
```

## ⚙️ Scripts

- **greeting.sh** - Time-based greeting message
- **weather-main.sh** - Fetches and displays weather
- **network-stats.sh** - Calculates download/upload speeds
- **process-top.sh** - Gets top CPU/memory processes

## 📝 Module Customization

Edit `config.jsonc` to:
- Change module positions (modules-left, modules-center, modules-right)
- Adjust update intervals (interval in seconds)
- Add/remove modules
- Change window positioning

## 🔧 Troubleshooting

### Weather not showing
- Verify API key in `scripts/weather-main.sh`
- Check internet connection
- Ensure `jq` is installed: `which jq`

### Network speeds not updating
- Replace `ens160` with your actual interface: `ip route | grep default`
- Ensure script is executable: `chmod +x ~/.config/waybar/scripts/network-stats.sh`

### Waybar window positioning issues
- Adjust `margin-top`, `margin-left`, `margin-bottom`, `margin-right` in config.jsonc
- Note: Exact positioning may vary based on monitor setup

## 📚 References

- [Waybar Documentation](https://github.com/Alexays/Waybar)
- [Wayland/Sway Documentation](https://swaywm.org/)
- [OpenWeatherMap API](https://openweathermap.org/api)

## 🔄 Comparison with Original Conky

| Feature | Conky | Waybar |
|---------|-------|--------|
| X11 Support | ✅ | ✅ |
| Wayland Support | ⚠️ Limited | ✅ Full |
| Sway Compatible | ⚠️ May have issues | ✅ Perfect |
| Configuration | Lua | JSON |
| Styling | Built-in | CSS |
| Weather | ✅ | ✅ |
| Network Stats | ✅ | ✅ |
| CPU/Memory | ✅ | ✅ |
| Process List | ✅ | ✅ |

## 📄 License

Based on original Enif theme by Jerry Chung (GPLv3)
Waybar conversion: 2024
