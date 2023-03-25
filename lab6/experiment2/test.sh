#!/bin/bash
N=$1
for i in $(seq 1 1 $N)
do
    ./mem.sh $i > /dev/null
done
