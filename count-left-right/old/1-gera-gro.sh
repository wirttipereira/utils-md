#RGP - 6.8.2020


# geracao das configuracoes .gro 

/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.xtc -s ../topol.tpr -b 1 -e 1 -o ns0.gro<<+
6
+ 

for i in {1..80..1}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../topol.tpr<<+
6
+
done

for i in {81..98..1}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../md_80_100.part0007.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../md_80_100.tpr<<+
6
+
done

#for i in {73..80..1}
#do 
#/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.part0005.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../topol.tpr<<+
#5
#+
#done
