#!/bin/bash
while true; do
	read line
	echo "$line" > pipe
	if [[ $line == "QUIT" ]]
	then
		exit
	fi
	if ! [[ "$line" =~ ^-?[0-9]+$ ]] && ! [[ "$line" == "+" ]] && ! [[ "$line" == "*" ]]
	then
		exit
	fi
done
