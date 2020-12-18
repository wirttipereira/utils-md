#!/bin/bash
#Rafael Guimaraes - 16.11.18
#
# Rerun: 18.12.2020 - http://www.mdtutorials.com/gmx/complex/09_analysis.html
# ------------

#module load gromacs/5.1.5_openmpi_gnu
#gmx=gmx_mpi
gmx='gmx'


file="escolhidos.dat"
top="../../topol.top"
mdp="md.mdp"

while IFS= read line 
do
        echo "$line"
        #cp ./gro/conf"$line".gro .
        $gmx grompp -p "$top" -f "$mdp" -c conf"$line".gro -o conf"$line".tpr -maxwarn 2

        cp rerun.pbs rerun$line.pbs
        sed -i '1,$s/XX/'$line'/g' rerun$line.pbs
        rm mdout.mdp
done<"$file"
