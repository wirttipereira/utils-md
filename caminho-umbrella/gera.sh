#RGP - 15-9-2020

>temp
>dados

##########
## SD
module load gromacs/5.1.5_openmpi_gnu
gmx=/scratch/app/gromacs/5.1.5_openmpi_gnu/bin/gmx_mpi
## ENIAC
#gmx='/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx'
###########

#$gmx density -nice 0 -b 1 -e 1 -f ../conf3500.xtc -s ../conf3500.tpr -ng 5 -sl 500 -o density<<+
#2
#3
#4
#5
#6
#+

passo=200

for i in {1000..7000..500}
do
$gmx trjconv -nice 0 -f ../conf$i.xtc -skip $passo -o caminho$i.gro -s ../conf$i.tpr<<+
0
+

cat caminho$i.gro|grep C111379 > temp

file="temp"

#gera a coluna de tempo
j=0
while IFS= read line
do
	j=$(($j+$passo))
	echo "$j  $line" >> dados$i
done<"$file"

rm temp

done
