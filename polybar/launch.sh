#!/usr/bin/bash

killall -q polybar

while pgrep -x >/dev/null; do sleep 1;done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload toph &
  done
else
  polybar --reload toph &
fi
