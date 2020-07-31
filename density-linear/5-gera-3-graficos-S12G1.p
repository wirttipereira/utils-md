set term png size 1200,600
set output 'dlAS0DB80.png'
#set term x11 size 1200,600 title 'AS0DB80'
set multiplot layout 1,3

set yrange [0:5]
set xlabel 'Z / nm'
set ylabel 'Number density / nm-3'

p '01ns250.xvg'   u 1:6 w l lw 3 smooth bezier,\
  '02ns750.xvg'   u 1:6 w l lw 3 smooth bezier,\
  '03ns1750.xvg'  u 1:6 w l lw 3 smooth bezier,\
  '04ns2750.xvg'  u 1:6 w l lw 3 smooth bezier,\
  '05ns4750.xvg'  u 1:6 w l lw 3 smooth bezier,\
  '06ns7250.xvg'  u 1:6 w l lw 3 smooth bezier

p '07ns9750.xvg'  u 1:6 w l lw 3 smooth bezier,\
  '08ns14750.xvg' u 1:6 w l lw 3 smooth bezier,\
  '09ns19250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '10ns24750.xvg' u 1:6 w l lw 3 smooth bezier,\
  '11ns29750.xvg' u 1:6 w l lw 3 smooth bezier,\
  '12ns39250.xvg' u 1:6 w l lw 3 smooth bezier

p '13ns49250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '14ns59250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '15ns69250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '16ns80250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '17ns90250.xvg' u 1:6 w l lw 3 smooth bezier,\
  '18ns99000.xvg' u 1:6 w l lw 3 smooth bezier
