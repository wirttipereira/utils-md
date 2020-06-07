set terminal png size 1000, 1000
set output '2Dco2-plot.png'
set title 'Analise temporal de densidade do CO2'
plot for [i=1:20] 'ns'.i.'.xvg' u 1:7 w filledcu title 'tempo ns:'.i
