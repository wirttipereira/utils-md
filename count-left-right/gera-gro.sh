#RGP - 6.8.2020


# geracao das configuracoes .gro 
for i in {1..100..1}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.xtc -b $i -e $i -o ns$i.gro  -s ../topol.tpr<<+
7
+
done
