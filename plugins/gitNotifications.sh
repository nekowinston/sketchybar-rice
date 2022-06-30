#!/usr/bin/env bash

NOTIFICATIONS="$(gh api notifications | jq '.[]')"

if [ "$NOTIFICATIONS" = "" ]; then
  sketchybar --set "$NAME" icon=  icon.colour="${ROSEWATER}"
else
  sketchybar --set "$NAME" icon=  icon.colour="${RED}"
fi

