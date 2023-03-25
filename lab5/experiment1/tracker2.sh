#!/bin/bash
> "tracker2.out"
bash mem.bash &
pid=$!
bash mem2.bash &
pid2=$!

echo "PID of mem.bash: $pid PID of mem2.bash: $pid2"
echo "PID of mem.bash: $pid PID of mem2.bash: $pid2" >> "tracker2.out"
while true
do	
	if [[ "$(ps -p $pid --no-headers)" == "" ]] && [[ "$(ps -p $pid2 --no-headers)" == "" ]]
	then
		break
	fi
	data=$(top -b -n 1)
	echo "$data" | head -n 15 >> "tracker2.out"
	echo >> "tracker2.out"
	sleep 2s
done

dmesg | grep "$pid" | tail -n 2 >> "tracker2.out"
tail -n 1 "report.log" >> "tracker2.out"
echo "" >> "tracker2.out"
dmesg | grep "$pid2" | tail -n 2 >> "tracker2.out"
tail -n 1 "report2.log" >> "tracker2.out"
