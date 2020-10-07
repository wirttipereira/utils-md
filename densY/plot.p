#set term png size 1200,600
#set output 'densY.png'

#set multiplot layout 1,2

set xrange [15:24]
set yrange [0:4.5]

set xlabel 'Z / nm'
set ylabel 'Y / nm'
p 'anion-F.dat' u 3:2 pt 6 ps .6 lc rgb 'green',\
  'anion-N.dat' u 3:2 pt 6 ps .7 lc rgb 'blue',\
  'anion-O.dat' u 3:2 pt 6 ps .6 lc rgb 'red',\
  'density.xvg' u 1:2 w l lc 0 notitle,\
  'cation-Nq.dat' u 3:2 pt 6 ps .6 lc rgb 'cyan',\
  'cation-Cn.dat' u 3:2 pt 6 ps .6 lc rgb 'brown',\
  .75 lc 0 notitle, 2.25 lc 0 notitle, 3. lc 0 notitle, 4.5 lc 0 notitle,\
  '../caminho/dados' u 6:5 pt 7 ps 1. lc 0 title 'co2x'

