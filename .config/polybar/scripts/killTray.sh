# A script to kill system tray in polybar
# script by Jerry Chung
#! /bin/bash

u=$(xprop -name "Polybar tray window" _NET_WM_PID | grep -o '[[:digit:]]*')
kill $u

exit