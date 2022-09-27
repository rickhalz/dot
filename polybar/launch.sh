!/usr/bin/env bash

# Terminate already running bar instances
pkill -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
