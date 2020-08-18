#RGP - 13.8.2020

# md.log - 62000 e continua

#na escala de ps

#gmx trjconv -nice 0 -f ../../traj_comp.xtc -s ../../topol.tpr -b 1 -e 1 -o ns0.gro

for i in {100..5000..100}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../../traj_comp.xtc -b $(($i*1)) -e $(($i*1)) -o ns$(($i+0)).gro  -s ../../topol.tpr<<+
6
+
done
