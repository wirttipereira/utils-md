#RGP - 15-9-2020

>temp
>dados

passo=10000

####################################################
##SD
module load gromacs/5.1.5_openmpi_gnu
gmx='gmx_mpi'
##ENIAC
#gmx='/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx'
####################################################

##gera as configuracoes
$gmx trjconv -nice 0 -f ../traj_comp.xtc -skip $passo -o densidades.gro -s ../topol.tpr<<+
0
+
##gera o arquivo de densidade para plotar o eletrodo junto
$gmx density -nice 0 -b 1 -e 1 -f ../traj_comp.xtc -s ../topol.tpr -ng 5 -sl 500 -o density<<+
2
3
4
5
6
+

for i in N F O Nq Cn
do
	out=$i.dat
	cat densidades.gro | grep " $i" > temp
	file="temp"

	#gera a coluna de tempo
	i=0
	while IFS= read line
	do
		i=$(($i+$passo))
		echo "$i  $line" >> $out
	done<"$file"

	rm temp
	#na proxima linha, editar os limites manualmente. $7 eh a coluna z
	cat $out |sort -n -k 7 | awk '($7>15) && ($7<34) {print $5 "\t" $6 "\t" $7}' >temp

	cp temp $out
	rm temp

done

#####################################
##anion N
#cat densidades.gro|grep ' N' > temp
#out='anion-N.dat'
##anion F
#cat densidades.gro|grep ' F' > temp
#out='anion-F.dat'
##anion O
#out='anion-O.dat'
#cat densidades.gro|grep ' O' > temp
##cation Nq
#out='cation-Nq.dat'
#cat densidades.gro|grep ' Nq' > temp
##cation Cn
#out='cation-Cn.dat'
#cat densidades.gro|grep ' Cn' > temp
#####################################


