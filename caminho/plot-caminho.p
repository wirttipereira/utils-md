#RGP - 16.9.2020

set xrange[14:22]
set yrange[0:4.5]
set title 'Caminho do co2x'
set xlabel 'Z / nm'
set ylabel 'Y / nm'
p 'dados' u 6:5 w l lc 1,\
  'density.xvg' u 1:2 w l lc 2,\
  0.75 lc 0 notitle, 2.25 lc 0 notitle, 3 lc 0 notitle, 4.5 lc 0 notitle

