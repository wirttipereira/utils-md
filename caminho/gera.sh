#RGP - 15-9-2020

>temp
>dados

gmx='/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx'
passo=200

$gmx trjconv -nice 0 -f ../traj_comp.xtc -skip $passo -o caminho.gro -s ../topol.tpr<<+
0
+

$gmx density -nice 0 -b 1 -e 1 -f ../traj_comp.xtc -s ../topol.tpr -ng 5 -sl 500 -o density<<+
2
3
4
5
6
+

cat caminho.gro|grep C111379 > temp

file="temp"

#gera a coluna de tempo
i=0
while IFS= read line
do
	i=$(($i+$passo))
	echo "$i  $line" >> dados
done<"$file"

rm temp

