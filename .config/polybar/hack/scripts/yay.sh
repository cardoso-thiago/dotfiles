#!/bin/sh
# Get list and count of updates
if ! updates=$(yay -Qu --devel --timeupdate | wc -l); then
    updates=0
fi

# Print the available updates if more than 0
if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo " None"
fi