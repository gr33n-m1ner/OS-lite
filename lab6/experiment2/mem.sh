#!/bin/bash
N=150000
count=0
while read -r line
do
    val=$(($line * 2))
    echo "$val" >> "files/file$1.txt"
    count=$(($count + 1))
    if [[ $count == $N ]]
    then
        break
    fi
done < "files/file$1.txt"
