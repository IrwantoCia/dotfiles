#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar for each connected monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/config_$m.ini main &
  done
else
  polybar --reload -c ~/.config/polybar/config.ini main &
fi
# 
 echo "Bars launched..."

#rm /tmp/polybar*
#rm /tmp/ipc-polybar*
## Launch bar1 and bar2
#polybar --reload -c ~/.config/polybar/config.ini main &
#ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-top
#
#polybar --reload -c ~/.config/polybar/config_bottom.ini main &
#ln -s /tmp/polybar_mqueue.$! /tmp/ipc-polybar-bottom
#polybar --reload -c ~/.config/polybar/config_monitor_2.ini main &

# Hide the bottom bar by default. Can be toggled with a shortcut.
#sleep 1
#echo cmd:hide > /tmp/ipc-polybar-bottom

