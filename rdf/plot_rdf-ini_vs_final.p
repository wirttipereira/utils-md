set term png size 1000, 700
set output 'rdfAS2DB80.png'
set title 'AS2DB80 - Assimetric, S12G1:NTf2, 2V, 500 CO2, 350K, 80ns - inicial vs final'
set xlabel 'r / nm'
set ylabel 'g(r)'
p 'cat-an-2000.xvg' u 1:2 title 'cat-an inicial' w l lw 3 lt 1 lc rgb "black", 'cat-an-75000.xvg' u 1:2 title 'cat-an final' w l lw 3 lc rgb "red", 'cat-cat-2000.xvg' u 1:2 title 'cat-cat inicial' w l lw 3 lt 1 lc rgb "blue", 'cat-cat-75000.xvg' u 1:2 title 'cat-cat final' w l lw 3 lt 1 lc rgb "green", 'an-an-2000.xvg' u 1:2 title 'an-an inicial' w l lw 3 lt 1 lc rgb "orange", 'an-an-75000.xvg' u 1:2 title 'an-an final' w l lw 3 lt 1 lc rgb "purple"
