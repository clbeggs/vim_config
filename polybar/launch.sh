#!/bin/bash
# Terminate already running bar instances
killall -q polybar

# killall doesn't seem to kill the scripts started by the bar.
# So, the following ways work better
# kill $(ps aux | grep 'polybar' | awk '{print $2}')  >/dev/null 2>&1
# kill -9 $(pgrep -f 'polybar') >/dev/null 2&1

# polybar-msg cmd quit >/dev/null 2>&1

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar -c ~/.config/polybar/config mainbar &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/config mainbar &
  done
fi
