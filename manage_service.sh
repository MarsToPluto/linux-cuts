#!/bin/bash

# Usage: ./manage_service.sh <service-name> <start|stop|restart|status>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <service-name> <start|stop|restart|status>"
    exit 1
fi

SERVICE=$1
ACTION=$2

echo "${ACTION^}ing $SERVICE..."

sudo systemctl $ACTION $SERVICE

echo "Service $SERVICE $ACTION completed."
