#!/usr/bin/env sh

case "$INFO" in
  "WezTerm")
    ICON=" ";;
  *)
    ICON="";;
esac

sketchybar --set "$NAME" label="$INFO" icon="$ICON"
