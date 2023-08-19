#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
#polybar log -c ~/.config/polybar/current.ini &
#polybar secondary -c ~/.config/polybar/current.ini &

## Right bar
#polybar top -c ~/.config/polybar/current.ini &
#polybar primary -c ~/.config/polybar/current.ini &

## Center bar
#polybar primary -c ~/.config/polybar/workspace.ini &

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar barbar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
