set term png size 1200,600
set output 'clrXXXXXXX.png'
#set term x11 size 1200,600 #title 'AS0DB80'
set multiplot layout 1,2

#set yrange [0:14]
set xlabel 't / ns'
set ylabel 'Number of carbons (CO2) / n'

p 'data.bulk' u 1:2 w l lw 1 title 'left',\
  'data.bulk' u 1:3 w l lw 1 title 'right',\
  'data.bulk' u 1:4 w l lw 1 title 'left+right'

p 'data.bulk' u 1:2 w l lw 1 title 'left - smooth' smooth bezier,\
  'data.bulk' u 1:3 w l lw 1 title 'right - smooth' smooth bezier,\
  'data.bulk' u 1:4 w l lw 1 title 'left+right - smooth' smooth bezier
