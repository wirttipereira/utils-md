#! /bin/bash
# Distancia entre o centro de massa das moleculas
# RDF: Radial Distribution Functions
g_rdf -f traj.xtc -nice 0 -ng 2 -rdf mol_com -o 1rdf <<+
2
3
4
+
