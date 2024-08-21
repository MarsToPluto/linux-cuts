#!/bin/bash

echo "Clearing system cache..."

# Clear PageCache, dentries, and inodes
sudo sync; sudo sysctl -w vm.drop_caches=3

echo "System cache cleared."
