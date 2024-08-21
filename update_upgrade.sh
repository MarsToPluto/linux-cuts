#!/bin/bash

echo "Updating and upgrading the system..."

# Update package lists
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Remove unused packages
sudo apt autoremove -y

# Clean up the package cache
sudo apt clean

echo "System update and upgrade complete."
