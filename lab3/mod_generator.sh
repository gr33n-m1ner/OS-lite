#!/bin/bash
echo $$ > .genpid
while true
do                                                                  
	read line
	rand_num=$((1 + RANDOM % 6))
	
    	if [[ "$line" == "QUIT" ]]
    	then 
    		kill -SIGTERM $(cat .pid)
    	elif [[ "$line" =~ ^[1-6]$ ]]
    	then 
    		result=$(( $rand_num - $line ))
    		if [[ result -lt 0 ]]
		then 
			kill -USR1 $(cat .pid)
			kill -USR1 $(cat .pid)
		elif [[ result -eq 0 ]]
		then
			kill -USR1 $(cat .pid)	
		fi
    		kill -USR2 $(cat .pid)
    	fi
done  
