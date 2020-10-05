#!/bin/bash
#Rafael Guimaraes - 16.11.18

#module load gromacs/5.1.5_openmpi_gnu
#gmx=gmx_mpi
#
file="escolhidos.dat"
#top="../topol.top"
#mdp="md.mdp"
mkdir temp

while IFS= read line 
do
	cp conf$line.tpr ./temp

done<"$file"
