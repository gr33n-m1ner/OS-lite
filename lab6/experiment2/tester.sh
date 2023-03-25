#!/bin/bash
TIMEFORMAT="%R"
for i in $(seq 1 1 20)
do
    for j in $(seq 1 1 10)
    do
        ./create_files.sh
        time ./test.sh $i
    done 2> temp
    avg=$(paste -sd+ temp | sed 's/\,/./'g | bc -l)
    avg=$(echo "$avg/10" | bc -l)
    echo "$i $avg"
done 
