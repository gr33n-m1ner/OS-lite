while read -r line
do
	path=$(echo "$line" | awk '{print $1}')
	filename=$(basename "$path")
	dirname=$(dirname "$path")
	link=$(echo "$line" | awk '{print $2}')
	if ! [[ -f "$HOME/.trash/$link" ]] && ! [[ -d "$HOME/.trash/$link" ]]
	then 
		continue
	fi
	if [[ "$1" == "$filename" ]]
	then
		echo "This file? y/n ""$path"
		read reply <&1
		if [[ "$reply" == "y" ]]
		then 
			if ! [[ -d "$dirname" ]]
			then 
				echo "Directory not found, recovering to home directory"
				dirname "$HOME"
			fi
			
			while true
			do
				if [[ -f "$dirname/$filename" ]] || [[ -d "$dirname/$filename" ]]
				then
					echo "Name conflict. New name will be created"
					extension="${filename##*.}"
					name="${filename%.$extension}"
					count=1
					if [[ $name =~ ^.*\([0-9]+\)$ ]]
					then 
						number_tmp="${name##*(}"
						count="${number_tmp%)}"
						name="${name%($count)}"
						count=$(( count + 1))
					fi
					filename="$name($count).$extension"
				else 
					break
				fi
			done
			mv "$HOME/.trash/$link" "$dirname/$filename"
			break
		fi	
	fi
done < ~/.trash.log
