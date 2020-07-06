set xlabel "time / ns"
set ylabel "CO_2 average density / Kg.m^{-3} "
p 'plot.data' u 1:2 w p title "gas bulk" lw 3 lc rgb "black"

#p 'plot.data' u 1:2 w p title "gas left" lw 3 lc rgb "black", 'plot.data' u 1:3 w p title "bulk" lw 3 lc rgb "red", 'plot.data' u 1:4 w p title "gas right" lw 3 lc rgb "green" 
