#!/usr/bin/env bash

# super quick full restart of sketchybar
quick_restart() {
  touch ~/.sketchybar_restart
  launchctl kickstart -k "gui/${UID}/homebrew.mxcl.sketchybar"
}

last_restart=$(stat -f %m ~/.sketchybar_restart)
now=$(date +%s)
diff=$((now - last_restart))

if [ $diff -gt 15 ]; then
  quick_restart
fi
