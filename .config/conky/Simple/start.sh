#!/bin/bash

killall conky
sleep 5s
		
conky -c $HOME/.config/conky/Simple/Simple.conf &> /dev/null &

exit