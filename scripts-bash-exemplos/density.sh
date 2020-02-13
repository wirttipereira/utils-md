#Rafael Guimaraes

cd f19-*
gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens number -ng 3 <<+
4
5
6
+

cd ../f34-*
gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens number -ng 3 <<+
4
5
6
+

cd ../f2-*
gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens number -ng 3 <<+
4
5
6
+

cd ../f17-*
gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens number -ng 3 <<+
4
5
6
+

cd ../f32-*
gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens number -ng 3 <<+
4
5
6
+


