#!/bin/bash

# Usage: ./user_manage.sh <add|del|list> <username>

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <add|del|list> [username]"
    exit 1
fi

ACTION=$1
USERNAME=$2

case $ACTION in
    add)
        if [ -z "$USERNAME" ]; then
            echo "Please provide a username to add."
            exit 1
        fi
        sudo adduser $USERNAME
        ;;
    del)
        if [ -z "$USERNAME" ]; then
            echo "Please provide a username to delete."
            exit 1
        fi
        sudo deluser --remove-home $USERNAME
        ;;
    list)
        cut -d: -f1 /etc/passwd
        ;;
    *)
        echo "Invalid action. Use 'add', 'del', or 'list'."
        exit 1
        ;;
esac

echo "User management action '$ACTION' completed."