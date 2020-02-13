#! /bin/sh
#Rafael 22-3-17
#mix com os atomos que estao mais proximos do eletrodo
#cation: O10
#anion: F
#editado em 29-3-17, retirado o solvente para IL puro
g_density -f traj.xtc -n index_atoms -dens number -ng 2 -o 13density_atoms_mix_v1 -b 2000 -sl 2000 -nice 0 <<+
15
21
+
