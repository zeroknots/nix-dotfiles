#!/usr/bin/env bash

next_event=$(
  icalBuddy -n -ea -eed -nc -iep 'title,datetime' -po 'datetime,title' -li 1 -ps '/ /' -b '' -df '' eventsToday | sed -E 's/^[^0-9]+//'
)

if [ ! -z "$next_event" ]; then
  echo "${next_event}  "  
fi
