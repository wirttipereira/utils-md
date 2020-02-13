cd f35-*
#cat1,cat1, an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f35-rdf-tma_tma-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f35-rdf-tfs-tfs<<+
5
5
+
