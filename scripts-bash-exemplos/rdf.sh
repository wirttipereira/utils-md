gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-tma_tma <<+
2
2
+

gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-tma_emi <<+
2
3
+

gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-tma_tfs <<+
2
4
+

gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-emi_emi <<+
3
3
+

gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-emi_tfs <<+
3
4
+

#gmx rdf -f traj.trr -s topol.tpr -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o 12.1-rdf-tfs_tfs <<+
#4
#4
#+

