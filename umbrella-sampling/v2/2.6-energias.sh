#!/bin/bash


##--- SANTOS DUMONT
module load gromacs/5.1.5_openmpi_gnu
gmx="gmx_mpi"
##--- ENIAC
#gmx='/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx' #gmx_mpi


#>energy.out
#file="escolhidos.dat"
#while IFS= read line
#do
#$gmx energy -f conf$line.edr -nice 0 -o energy$line >> energy.out<<+
#48
#49
#64
#65
#+
#done<"$file"

cat energy.out |grep Coul-SR:nc4 | awk '{print $2} '>aux
paste escolhidos.dat aux > COUL-cation-co2x.dat
cat energy.out |grep Coul-SR:ntf2| awk '{print $2}' >aux
paste escolhidos.dat aux > COUL-anion-co2x.dat
cat energy.out |grep LJ-SR:nc4 | awk '{print $2} '>aux
paste escolhidos.dat aux > LJ-cation-co2x.dat
cat energy.out |grep LJ-SR:ntf2| awk '{print $2}' >aux
paste escolhidos.dat aux > LJ-anion-co2x.dat

#Coul-SR:nc4-co2x         1.0526e-08    9.9e-09 6.35836e-07 4.05872e-08  (kJ/mol)
#LJ-SR:nc4-co2x           -1.10345e-07    6.6e-08 3.99397e-06 -2.63121e-07  (kJ/mol)
#Coul-SR:ntf2-co2x        -8.17969e-11    3.9e-09 2.6449e-07 -2.90782e-09  (kJ/mol)
#LJ-SR:ntf2-co2x          -5.06797e-09    2.2e-09 2.92201e-07 1.35855e-08  (kJ/mol)
