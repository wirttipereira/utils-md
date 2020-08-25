#!/bin/bash
#Rafael Guimaraes - 16.11.18


file="escolhidos.dat"
top="topol.top"
mdp="md.mdp"
gmx="/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx"

while IFS= read line 
do
	echo "$line"
	cp ../1-umbrella-conf/conf"$line".gro .
	$gmx grompp -p ../pull/"$top" -f "$mdp" -c conf"$line".gro -o conf"$line".tpr -maxwarn 2
	
	#AQUI para rodar em computador proprio
	#$gmx mdrun -deffnm conf"$line"
	
	#AQUI para rodar o ENIAC
	cp run.pbs run$line.pbs
	sed -i '1,$s/XX/'$line'/g' run$line.pbs
done<"$file"
