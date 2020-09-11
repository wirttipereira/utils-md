#!/bin/bash
#Rafael Guimaraes - 16.11.18

>3-tpr-files.dat
>3-pullf-files.dat

file="escolhidos.dat"

while IFS= read line 
do
	echo "$line"
	echo "conf"$line".tpr" >> "3-tpr-files.dat"
	echo "conf"$line"_pullf.xvg" >> "3-pullf-files.dat"

done<"$file"
