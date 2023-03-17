#!/bin/bash
script="$HOME/first_laba/lab3/task4inf.sh"

bash $script &
pid1=$!
bash $script &
pid2=$!
bash $script &
pid3=$!

top -b -n 1 | grep -e "$pid1" -e "$pid2" -e "$pid3"
cpulimit --limit 10 -p $pid1 &

kill $pid3
sleep 10s

top -b -n 1 | grep -e "$pid1"
