#Rafael GP - 24.10.19

gmx make_ndx -f confout.gro<<+
q
+

gmx potential -f traj_comp.xtc -sl 800 -b 5000 -nice 0 -o f35-potential<<+
0
+

