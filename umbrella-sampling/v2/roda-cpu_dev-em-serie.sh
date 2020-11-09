#RGP - 2.9.2020

>log
#sleep 10m

for ((i=0; i<11; i++))
do
	echo $i
	sbatch restart.srm
	sleep 21m 
done

#file='escolhidos.dat'
#
#
#echo date > log
#
#while IFS= read line
#do
#	echo $line >> log
#	sbatch run$line.srm
#	sleep 21m
#
#done<"$file"

echo date >> log

