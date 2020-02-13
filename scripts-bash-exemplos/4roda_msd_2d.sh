#! /bin/bash
# calcula somente em xy excluindo o eixo z
g_msd -f traj.xtc -nice 0 -ngroup 3 -b 1000 -lateral z -o 4msd_2d <<+
2
3
4
+
