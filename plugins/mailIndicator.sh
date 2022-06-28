#!/usr/bin/env bash

UNREAD_ONLY=false
MAIL_DIR=~/.local/share/mail

COUNT=0

if [[ -d ${MAIL_DIR} ]]; then
  for dir in "${MAIL_DIR}"/*/; do
    # get file count for the unread mailbox, add to count
    COUNT=$(( $( ls ${dir}INBOX/new | wc -l ) + $COUNT ))

    # also add the rest of the inbox if var is set
    if ! ($UNREAD_ONLY); then
      COUNT=$(( $( ls ${dir}INBOX/cur | wc -l ) + $COUNT ))
    fi

  done
fi

if [[ $mailcount -gt 0 ]]; then
  ICON=" "
else
  ICON=" "
fi

sketchybar --set "$NAME" label="$COUNT" icon="$ICON"
