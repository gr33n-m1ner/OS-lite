for i in $(seq 1 1 20)
do
    yes "10000000" | head -n 150000 > "files/file$i.txt"
done