#RGP - 6.8.2020


# geracao das configuracoes .gro 
#for i in {1..53..1}
#do 
#/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../topol.tpr<<+
#5
#+
#done

#for i in {54..72..1}
#do 
#/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.part0004.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../topol.tpr<<+
#5
#+
#done

#for i in {73..80..1}
#do 
#/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.part0005.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$i.gro  -s ../topol.tpr<<+
#5
#+
#done

for i in {1..20..1}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../2/traj_comp.xtc -b $(($i*1000)) -e $(($i*1000)) -o ns$(($i+80)).gro  -s ../2/topol.tpr<<+
5
+
done
