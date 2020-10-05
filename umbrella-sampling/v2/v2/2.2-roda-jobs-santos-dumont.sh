#!/bin/bash
#Rafael Guimaraes - 16.11.18

file="escolhidos.dat"

while IFS= read line 
do
	echo "$line"
	sbatch run$line.srm
	#sleep 7m
done<"$file"
