#set terminal png size 1000, 1000
#set output '3Dco2-plot.png'set title 'Analise temporal de densidade do CO_2'
set title 'Analise temporal de densidade do CO2'
set xlabel 'Time / ns'
set ylabel 'Z / nm' 
set zlabel 'Number / nm3' rotate by 90
splot for [i=1:80:5] 'ns'.i.'.xvg' u (i):1:7 notitle w filledcu #lc 0 #title 'tempo ns:'.i
#set view 45,90,1,1
#set output '3Dco2-plot2.png'
#splot for [i=1:20] 'ns'.i.'.xvg' u (i):1:7 w filledcu title 'tempo ns:'.i
