#!/bin/bash

module load gromacs/5.1.5_openmpi_gnu

gmx=gmx_mpi
file="escolhidos.dat"
tpr="../topol.tpr"
xtc="../traj_comp.xtc"
#reseta arquivo de saida
mkdir gro

while IFS= read line
do
	echo 0 | $gmx trjconv -s ${tpr} -f ${xtc} -o ./gro/conf$line.gro -nice 0 -b $line -e $line
done<"$file"
