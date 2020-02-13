#Rafael Guimaraes - 5.1.20

gmx density -f traj_comp.xtc -nice 0 -sl 800 -b 5000 -dens charge -ng 2 -o f35-dens-charge-TMA-TFS<<+
4
5
+
mv f35-dens-charge-TMA-TFS.xvg f35-dens-charge-TMA-TFS.xv
