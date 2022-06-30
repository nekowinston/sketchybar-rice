#!/usr/bin/env bash

DATE="$(ddate +'%{%A, %b %d%}%N Celebrate %H!')"
sketchybar --set "$NAME" label="$DATE" icon=" "
