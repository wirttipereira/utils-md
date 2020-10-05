#!/bin/bash
#Rafael Guimaraes - 16.11.18

#module load gromacs/5.1.5_openmpi_gnu
#gmx=gmx_mpi
#
file="remove_jobs.dat"
#top="../topol.top"
#mdp="md.mdp"

while IFS= read line 
do
	scancel $line
done<"$file"
