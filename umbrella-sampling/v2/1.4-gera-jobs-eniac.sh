#!/bin/bash
#Rafael Guimaraes - 16.11.18, 7.10.2020

##############
## SD
module load gromacs/5.1.5_openmpi_gnu
gmx='gmx_mpi'
#
## Eniac
#gmx='gmx'
#
###############
file="escolhidos.dat"
top="../sim2/topol.top"  #"../sim3/topol.top"
mdp="md.mdp"

>temp
cont=1
j=1
while IFS= read line 
do
#	if [$cont -eq 20]
#	then  
#		j=$(($j+1))
#		cont=1
#	fi

	#srun --resv-ports --nodes 4 --ntasks 96   $EXEC  -sf opt -in lammps.in.100ps > saida.log &
	#echo "$line"
	$gmx grompp -p "$top" -f "$mdp" -c ./gro/conf"$line".gro -o ./gro/conf"$line".tpr -maxwarn 2
	echo srun --resv-ports --nodes 1 --ntasks 24 '$EXEC' mdrun  -s conf$line.tpr -deffnm conf$line '&'>> temp #$j 
	#cp run.pbs run$line.pbs
	#cp restart.pbs restart$line.pbs
	#cp run.srm run$line.srm
	#cp restart.srm restart$line.srm
	#sed -i '1,$s/XX/'$line'/g' run$line.pbs
	#sed -i '1,$s/XX/'$line'/g' restart$line.pbs
	#sed -i '1,$s/XX/'$line'/g' run$line.srm
	#mv run$line.srm ./gro
	#sed -i '1,$s/XX/'$line'/g' restart$line.srm
	#rm mdout.mdp
#	cont=$(($cont+1))
done<"$file"
