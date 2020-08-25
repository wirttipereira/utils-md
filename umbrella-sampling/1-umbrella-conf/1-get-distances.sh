#!/bin/bash

#################################################
# get_distances.sh
#
#   Script iteratively calls gmx distance and
#   assembles a series of COM distance values
#   indexed by frame number, for use in
#   preparing umbrella sampling windows.
#
# Written by: Justin A. Lemkul, Ph.D.
#    Contact: jalemkul@vt.edu
#
#################################################

#modificado em 30.11.18 por Rafael Guimarães


gmx="/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx"
tpr="topol.tpr"
xtc="traj_comp.xtc"
configuracoes=50001
out='summary_distances.dat'
#reseta arquivo de saida
>out

#echo 0 | $gmx trjconv -s ../pull/${tpr} -f ../pull/${xtc} -o conf.gro -sep -nice 0

# compute distances
for (( i=0; i<$configuracoes; i++ ))
do
    $gmx distance -s ../pull/${tpr} -f conf${i}.gro -select 'com of group "DUM" plus com of group "co2x"' -oall dist${i}.xvg -nice 0
done
#
## compile summary
touch out
for (( i=0; i<$configuracoes; i++ ))
do
    d=`tail -n 1 dist${i}.xvg | awk '{print $2}'`
    echo "${i} ${d}" >> out
    rm dist${i}.xvg
done

exit;
