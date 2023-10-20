# A script to launch/kill system tray in polybar
# script by Jerry Chung

#!/usr/bin/env bash

# Launch tray
echo "---" | tee -a /tmp/tray.log
polybar tray 2>&1 | tee -a /tmp/tray.log & disown

echo "System tray launched"

# Kill tray after 7s.
sleep 7s
u=$(xprop -name "Polybar tray window" _NET_WM_PID | grep -o '[[:digit:]]*')
kill $u

exit