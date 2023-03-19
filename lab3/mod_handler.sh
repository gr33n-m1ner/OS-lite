echo $$ > .pid
val=0
count=0

result()
{
	if [[ count -eq 2 ]]
	then 
		val=$(( val + 10 ))
		echo "You win! Score: $val"
	elif [[ count -eq 1 ]]
	then
		echo "Draw. Score: $val"
	else 
		val=$(( val - 10))
		echo "You lose.. Score: $val"
	fi
	count=0
}

add() {
	count=$(( count + 1 ))
}

terminate()
{
	echo "Done"
	kill $(cat .genpid)
	exit
}

trap 'add' USR1
trap 'result' USR2
trap 'terminate' SIGTERM

while true
do
	:
done
