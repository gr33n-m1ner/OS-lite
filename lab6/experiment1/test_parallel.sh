N=$1
for i in $(seq 1 1 $N)
do
    val=$( echo "1/(1+$i)" | bc -l)
    ./calc 50000 $val > /dev/null &
done
wait