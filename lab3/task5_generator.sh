#!/bin/bash
while true; do
	read line
	echo "$line" > pipe
	if [[ $line == "QUIT" ]]
	then
		exit
	fi
done
