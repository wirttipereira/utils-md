#10.9.2020 - RGP

squeue |grep cpu_small | grep ' R ' | cut -b 13-18 > temp

file="temp"

while IFS= read line 
do
	#echo "$line"
	scontrol show jobid $line |grep RunTime 
done<"$file"

rm temp
