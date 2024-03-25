#!/bin/bash

# Closebox73
# Simple script to get playerctl status

PCTL=$(playerctl status)

if [[ ${PCTL} == "" ]]; then
	echo "Sem Música"
else
	playerctl metadata xesam:artist | awk 'length($0) > 15 {print substr($0, 1, 15) "..."; next} 1'
fi

exit
