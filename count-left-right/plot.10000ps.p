#set term png size 1200,600
#set output 'clrAN2DB-10000ps.png'
#set term x11 size 1200,600 #title 'AS0DB80'
set multiplot layout 1,2

#set yrange [0:14]
set xlabel 't / ps'
set ylabel 'Number of CO2 carbon atoms per bulk volume / CO2 carbon.nm-3'

p 'data.bulk.10000ps' u 1:2 w l lw 1 lc rgb 'black'  title 'left',\
  'data.bulk.10000ps' u 1:3 w l lw 1 lc rgb 'red'    title 'right',\
#  'data.bulk.10000ps' u 1:4 w l lw 1 lc rgb 'green'  title 'left + right',\
  'data.bulk.10000ps' u 1:5 w l lw 1 lc rgb 'blue'   title 'gas',\
#  'data.bulk.10000ps' u 1:6 w l lw 1 lc rgb 'cyan'   title 'total',\

p 'data.bulk.10000ps' u 1:2 w l lw 1 lc rgb 'black'  title 'left - smooth' smooth bezier,\
  'data.bulk.10000ps' u 1:3 w l lw 1 lc rgb 'red'    title 'right - smooth' smooth bezier,\
#  'data.bulk.10000ps' u 1:4 w l lw 1 lc rgb 'green'  title 'left + right - smooth' smooth bezier,\
  'data.bulk.10000ps' u 1:5 w l lw 1 lc rgb 'blue'   title 'gas - smooth' smooth bezier,\
#  'data.bulk.10000ps' u 1:6 w l lw 1 lc rgb 'cyan'   title 'total - smooth' smooth bezier
