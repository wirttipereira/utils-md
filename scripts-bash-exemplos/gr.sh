##Xtma=0

cd f16-*
#cat2-cat 2 e cat2-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f16-rdf-emi_emi-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f16-rdf-tfs-tfs<<+
5
5
+

cd ../f1-*
#cat2-cat 2 e cat2-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f1-rdf-emi_emi-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f1-rdf-tfs-tfs<<+
5
5
+

cd ../f31-*
#cat2-cat 2 e cat2-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f31-rdf-emi_emi-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f31-rdf-tfs-tfs<<+
5
5
+


## Xtma=0.5
cd ../f33-*
#cat1-cat1, cat2, an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f33-rdf-tma_tma-emi-tfs<<+
4
4
5
6
+
#cat2-cat2,an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f33-rdf-emi_emi-tfs<<+
5
5
6
+
#AN-AN
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f33-rdf-tfs_tfs<<+
6
6
+
cd ../f18-*
#cat1-cat1, cat2, an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f18-rdf-tma_tma-emi-tfs<<+
4
4
5
6
+
#cat2-cat2,an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f18-rdf-emi_emi-tfs<<+
5
5
6
+
#AN-AN
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f18-rdf-tfs_tfs<<+
6
6
+
cd ../f3-*
#cat1-cat1, cat2, an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f3-rdf-tma_tma-emi-tfs<<+
4
4
5
6
+
#cat2-cat2,an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f3-rdf-emi_emi-tfs<<+
5
5
6
+
#AN-AN
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f3-rdf-tfs_tfs<<+
6
6
+

##Xtma=1

cd ../f35-*
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

cd ../f20-*
#c
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f20-rdf-tma_tma-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f20-rdf-tfs-tfs<<+
5
5
+

cd ../f5-*
#cat2-cat 2 e cat2-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f5-rdf-tma_tma-tfs<<+
4
4
5
+
#an-an
gmx rdf -s topol.tpr -f traj_comp.xtc -nice 0 -b 5000 -selrpos mol_com -seltype mol_com -o f5-rdf-tfs-tfs<<+
5
5
+




