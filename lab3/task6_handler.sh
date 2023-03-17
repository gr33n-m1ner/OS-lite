echo $$ > .pid
val=1
mode=1

add()
{
	mode=1
	echo "+"
}

multiply()
{
	mode=2
	echo "*"
}


terminate()
{
	echo "Done"
	exit
}

trap 'add' USR1
trap 'multiply' USR2
trap 'terminate' SIGTERM

while true
do
	if [[ $mode -eq 1 ]]
	then
		val=$(( $val + 2 ))
	else
		val=$(( $val * 2 ))
	fi
	echo "$val"
	sleep 1s
done
