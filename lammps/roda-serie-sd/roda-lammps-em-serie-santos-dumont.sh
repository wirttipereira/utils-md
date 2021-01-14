#Rafael Guimaraes - 26.Nov.2020
#roda-em-serie-santos-dumont.sh

sleep 13m

for i in {0..4} #10 ciclos de 17min, 50ps*10=500ps
 do
 #cria backup do data1.txt
 cp data1.txt bk.data$(($i)).txt
 #tira o pair coef 
 sed -i '36,55d' data1.txt
 #coloca job
 sbatch run-lammps.srm
 sleep 13m
done
