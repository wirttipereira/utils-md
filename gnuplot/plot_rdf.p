set term png size 1000, 700
set output 'rdf_AS2MB80.png'
set title 'AS2MB80 - Assimetric, S12G1:NTf2, 2V, 1000 CO2, 350K, 80ns'
set xlabel 'r / nm'
set ylabel 'g(r)'
p 's12g1_co2-S12G1-NTf2.xvg' u 1:3 title 'cat-cat' w l lw 3 lc rgb "black", 's12g1_co2-S12G1-NTf2.xvg' u 1:4 title 'cat-an' w l lw 3 lc rgb "red", 'ntf2_co2-S12G1-NTf2.xvg' u 1:4 title 'an-an' w l lw 3 lc rgb "blue"
