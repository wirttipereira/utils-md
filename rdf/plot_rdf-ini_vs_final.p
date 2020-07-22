set term png size 1000, 700
set output 'rdf_AS2MB80-ini_vs_final.png'
set title 'AS2MB80 - Assimetric, S12G1:NTf2, 2V, 1000 CO2, 350K, 80ns - inicial vs final'
set xlabel 'r / nm'
set ylabel 'g(r)'
p 'inicial-s12g1_co2-S12G1-NTf2.xvg' u 1:4 title 'cat-an inicial' w l lw 3 lt 1 lc rgb "black", 's12g1_co2-S12G1-NTf2.xvg' u 1:4 title 'cat-an final' w l lw 3 lc rgb "red", 'inicial-s12g1_co2-S12G1-NTf2.xvg' u 1:3 title 'cat-cat inicial' w l lw 3 lt 1 lc rgb "blue", 's12g1_co2-S12G1-NTf2.xvg' u 1:3 title 'cat-cat final' w l lw 3 lt 1 lc rgb "green", 'inicial-ntf2_co2-S12G1-NTf2.xvg' u 1:4 title 'an-an inicial' w l lw 3 lt 1 lc rgb "orange", 'ntf2_co2-S12G1-NTf2.xvg' u 1:4 title 'an-an final' w l lw 3 lt 1 lc rgb "purple"
