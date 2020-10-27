#set term png size 1200,600
#set output 'plot-density-number.png'

#set multiplot layout 1,2

#set yrange [0:4.5]

set title 'Partial density'
set xlabel "Coordinate (nm)"
set ylabel "Number density (nm\S-3\N)"

p 'density-number.xvg' u 1:2 w l title 'eletr', '' u 1:3 w l title 'nc4', '' u 1:4 w l title 'ntf2',\
  '' u 1:5 w l title 'co2x', '' u 1:6 w l title 'DUM'

