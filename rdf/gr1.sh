#22.7.2020 - RGP

#cat-an
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 2000 -selrpos mol_com -seltype mol_com -o cat-an-2000<<+
2
3
+
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o cat-an-75000<<+
2
3
+
#cat-cat
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 2000 -selrpos mol_com -seltype mol_com -o cat-cat-2000<<+
2
2
+
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o cat-cat-75000<<+
2
2
+
#an-an
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 2000 -selrpos mol_com -seltype mol_com -o an-an-2000<<+
3
3
+
/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o an-an-75000<<+
3
3
+
#ref co2
#/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o co2_co2-S12G1-NTf2<<+
#6
#6
#2
#3
#+
#ref cat
#/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o s12g1_co2-S12G1-NTf2<<+
#2
#6
#2
#3
#+

#ref anion
#/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o ntf2_co2-S12G1-NTf2<<+
#3
#6
#2
#3
#+

#atomico
#/home/rafagp/exe/gromacs-5.1.4/build/bin/gmx rdf -n index.ndx -s ../topol.tpr -f ../traj_comp.xtc -nice 0 -b 75000 -selrpos mol_com -seltype mol_com -o OC_O1-Sc_O-S-N<<+
#7
#7
#8
#9
#10
#11
#12
#+
