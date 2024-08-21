#!/bin/bash

# Usage: ./backup.sh <source-directory> <destination-directory>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source-directory> <destination-directory>"
    exit 1
fi

SOURCE=$1
DESTINATION=$2
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

echo "Creating backup of $SOURCE to $DESTINATION/$BACKUP_NAME..."

# Create a compressed backup
tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"

echo "Backup created successfully at $DESTINATION/$BACKUP_NAME."
