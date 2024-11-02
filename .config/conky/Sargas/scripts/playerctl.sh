#!/bin/bash

# Closebox73
# Simple script to get playerctl status

PCTL=$(playerctl status)
ARTS=$(playerctl metadata xesam:artist)

if [[ ${PCTL} == "" ]]; then
	echo ""
else
	echo "${ARTS}"
fi

exit
