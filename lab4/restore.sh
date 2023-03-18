#!/bin/bash
found=""
home="/home/$USER"
restore="$home/restore"

mindif=-1
for entry in $(ls "$home")
do
	if ! [[ -d "$home/$entry" ]] || ! [[ "$entry" =~ Backup-[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
	then
		continue
	fi

	year=$(echo "$entry" | cut -d'-' -f2)
	month=$(echo "$entry" | cut -d'-' -f3)
	day=$(echo "$entry" | cut -d'-' -f4)

	dif=$(( ($(date -d "$date UTC" '+%s') - $(date -d "$year-$month-$day UTC" '+%s')) / (60*60*24) ))
	
	if [[ mindif -eq -1 ]] || [[ dif -lt mindif ]]
	then	
		found="$entry"
		mindif="$dif"
	fi
done
if [[ "$found" == "" ]]
then
	echo "Backup not found!"
	exit
fi
if ! [[ -d "$restore" ]]
then
	mkdir "$restore"
fi

for file in ${home}/${found}/*
do
	restore_path="$restore/${file#"$home/$found/"}"
	if [[ -d "$file" ]]
	then
		mkdir "$restore_path"
		continue
	fi
	if ! [[ -f "$file" ]]
	then 
		continue
	fi
	name=$(basename "$file")
	dir=$(dirname "$file")
	if [[ "$name" =~ .*.[0-9]{4}-[0-9]{2}-[0-9]{2} ]]
	then
		continue
	else
		cp "$file" "$restore_path"
	fi
done
