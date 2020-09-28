#!/bin/bash
#Rafael Guimaraes - 16.11.18

module load gromacs/5.1.5_openmpi_gnu
gmx=gmx_mpi

file="escolhidos.dat"
top="../topol.top"
mdp="md.mdp"

while IFS= read line 
do
	echo "$line"
	#cp ./gro/conf"$line".gro .
	#$gmx grompp -p "$top" -f "$mdp" -c ./gro/conf"$line".gro -o conf"$line".tpr -maxwarn 2
	
	#SD
	cp run.srm run$line.srm
	cp restart.srm restart$line.srm
	sed -i '1,$s/XX/'$line'/g' run$line.srm
	sed -i '1,$s/XX/'$line'/g' restart$line.srm
	##ENIAC
	#cp run.pbs run$line.pbs
	#cp restart.pbs restart$line.pbs
	#sed -i '1,$s/XX/'$line'/g' run$line.pbs
	#sed -i '1,$s/XX/'$line'/g' restart$line.pbs

	rm mdout.mdp
done<"$file"
