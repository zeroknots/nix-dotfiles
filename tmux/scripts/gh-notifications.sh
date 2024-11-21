#!/usr/bin/env bash

gh notify  -a -f "rhinestone" -s | grep -v "All caught" | wc -l | awk '{print $1}'
