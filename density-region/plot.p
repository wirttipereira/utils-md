#set terminal png size 1000, 1000
<<<<<<< HEAD
#set output 'Dens-media-co2-bulk.png'
#set title 'Densidade média de CO2 no bulk'
=======
#set output 'avg-co2-dens-bulk.png'
set title 'Avg. density of CO2 on bulk'

>>>>>>> ff4f89598857dd56161aa40e130c57f49ec4fcea
set xlabel "time / ns"
set ylabel "Avg. CO2 density / CO2 number "
p 'plot.data' u 1:2 w p title "gas bulk" lw 3 lc rgb "black"

#p 'plot.data' u 1:2 w p title "gas left" lw 3 lc rgb "black", 'plot.data' u 1:3 w p title "bulk" lw 3 lc rgb "red", 'plot.data' u 1:4 w p title "gas right" lw 3 lc rgb "green" 
