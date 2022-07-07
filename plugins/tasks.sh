#!/usr/bin/env bash

due=$(task count due.before:tomorrow status:pending)
week=$(task count due.before:eow status:pending)
month=$(task count due.before:eom status:pending)
total=$(task count status:pending)
sum=$((due + total))

if [[ $sum -eq 0 ]]; then
  ICON=" "
  LABEL="All done"
elif [[ $due -eq 0 ]]; then
  ICON=" "
  LABEL="$week/$month/$sum"
else
  ICON=" "
  LABEL="$week/$month/$sum"
fi

sketchybar --set "$NAME" label="$LABEL" icon="$ICON"
