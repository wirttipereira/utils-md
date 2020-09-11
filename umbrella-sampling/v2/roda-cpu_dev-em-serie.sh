#RGP - 2.9.2020

#sleep 10m

#for ((i=1; i<3; i++))
#do
#	sbatch run-cpu_dev-2.srm
#	sleep 21m 
#	echo $i
#done

file='escolhidos.dat'

>log

echo date > log

while IFS= read line
do
	echo $line >> log
	sbatch run$line.srm
	sleep 21m

done<"$file"

echo date >> log

