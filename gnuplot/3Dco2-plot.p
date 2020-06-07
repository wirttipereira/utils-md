set terminal png size 1000, 1000
set output '3Dco2-plot.png'
set title 'Analise temporal de densidade do CO2'
splot for [i=1:20] 'ns'.i.'.xvg' u (i):1:7 w filledcu title 'tempo ns:'.i
