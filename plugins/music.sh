#!/usr/bin/env sh

STATE=$(osascript -e 'tell application "Music" to player state as string' 2>/dev/null || echo "stopped")
TRACK=$(osascript -e 'tell application "Music" to name of current track as string' 2>/dev/null || echo "unknown track")
ARTIST=$(osascript -e 'tell application "Music" to artist of current track as string' 2>/dev/null || echo "unknown artist")

togglePlay() {
  if [ "$STATE" = "playing" ]; then
    osascript -e 'tell application "Music" to pause'
  else
    osascript -e 'tell application "Music" to play'
  fi
}

if [ "$STATE" = "playing" ]; then
  ICON=""
  OUTPUT="$ARTIST - $TRACK"
else
  ICON=""
  OUTPUT="Paused"
fi

sketchybar --set "$NAME" icon="$ICON" label="$OUTPUT" --add event "${NAME}-changed"
