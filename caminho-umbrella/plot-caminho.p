#RGP - 16.9.2020
#set term png size 1200,600
#set output 'densY.png'

#set multiplot layout 1,2
set xlabel 'Z / nm'
set ylabel 'Y / nm'


set xrange[16:23]
set yrange[0:4.5]
set title 'Caminho do co2x'
set xlabel 'Z / nm'
set ylabel 'Y / nm'

#primeiro plota o 'caminho' percorrido pelo co2x
#agora plota os atomos do anion e cation, aqui eh uma foto de um momento apenas
p for[i=1000:7000:500] 'dados'.i u 6:5 w p pt 7 lc 0 notitle,\
  'density.xvg' u 1:2 w l lc 2 notitle,\
  0.75 lc 0 notitle, 2.25 lc 0 notitle, 3 lc 0 notitle, 4.5 lc 0 notitle,\
  '../../densY/F.dat' u 3:2 pt 6 ps .6 lc rgb 'green',\
  '../../densY/N.dat' u 3:2 pt 6 ps .6 lc rgb 'blue',\
  '../../densY/O.dat' u 3:2 pt 6 ps .6 lc rgb 'red',\
  '../../densY/S.dat' u 3:2 pt 6 ps .6 lc rgb 'yellow',\
  '../../densY/Nq.dat' u 3:2 pt 6 ps .6 lc rgb 'cyan',\
  '../../densY/Ct.dat' u 3:2 pt 6 ps .6 lc rgb 'brown'

#  '../../densY/../caminho/dados' u 6:5 pt 7 ps 1. lc 0 title 'co2x'
