#!/bin/bash

THRESHOLD=80

echo "Checking disk space..."

USAGE=$(df -h / | grep -vE '^Filesystem' | awk '{ print $5 }' | sed 's/%//g')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk space usage is above $THRESHOLD%."
    echo "Current usage: $USAGE%"
else
    echo "Disk space usage is below $THRESHOLD%."
    echo "Current usage: $USAGE%"
fi
