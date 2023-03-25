#!/bin/bash
declare -a array
step=0
> report.log
while true
do
	array+=(1 2 3 4 5 6 7 8 9 10)
	step=$(($step + 1))
	if ! (( step % 100000 ))
	then
		echo "${#array[@]}" >> report.log
	fi
done
