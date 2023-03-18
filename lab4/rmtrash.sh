#!/bin/bash

last_id="$HOME/.trash/last_id.data"

if ! [[ -d ~/.trash ]]
then
	mkdir "$HOME/.trash"
	echo "0" > "$last_id"
fi

if [ -f "$1" ]
then
	id=$(cat "$last_id")
	ln $1 ~/.trash/"$id"
	echo "$(realpath $1) $id" >> ~/.trash.log
	id=$(( $id + 1 ))
	echo "$id" > "$last_id"
	rm $1
else
  	echo "No such file"
  	exit 1
fi

