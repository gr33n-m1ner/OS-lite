#!/bin/bash
> "tracker1.out"
bash mem.bash &
pid=$!

echo "PID of mem.bash: $pid"
echo "PID of mem.bash: $pid" >> "tracker1.out"
while true
do
	if [[ "$(ps -p $pid --no-headers)" == "" ]]
	then
		break
	fi
	data=$(top -b -n 1)
	echo "$data" | head -n 15 >> "tracker1.out"
	echo >> "tracker1.out"
	sleep 2s
done

dmesg | grep "$pid" | tail -n 2 >> "tracker1.out"
tail -n 1 "report.log" >> "tracker1.out"
