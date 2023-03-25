#!/bin/bash
N=$1
K=$2
for i in $(seq 1 $K)
do
	bash "newmem.bash" "$N" &
	sleep 1s
done
