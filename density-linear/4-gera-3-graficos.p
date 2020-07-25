set term x11 size 1200,600 title 'AN0DB80'
set multiplot layout 1,3

set yrange [0:10]
set xlabel 'Z / nm'
set ylabel 'Number density / nm-3'

p '01ns250.xvg' u 1:5 w l,\
  '02ns750.xvg' u 1:5 w l,\
  '03ns1750.xvg' u 1:5 w l,\
  '04ns2750.xvg' u 1:5 w l,\
  '05ns4750.xvg' u 1:5 w l,\

p '06ns7250.xvg' u 1:5 w l,\
  '07ns9750.xvg' u 1:5 w l,\
  '08ns19250.xvg' u 1:5 w l,\
  '09ns24750.xvg' u 1:5 w l,\
  '10ns29750.xvg' u 1:5 w l,\

p '11ns39250.xvg' u 1:5 w l,\
  '12ns49250.xvg' u 1:5 w l,\
  '13ns59250.xvg' u 1:5 w l

