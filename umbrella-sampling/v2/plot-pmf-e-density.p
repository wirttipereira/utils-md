set term eps
set output 'pmf_density-EXP17-20201009-0055.eps'
#set term png size 1200,600
#set output '.png'

#set multiplot layout 3,2


set y2tics 0, 5
set ytics nomirror
#set ytics -5,15

set xrange [15:23] 
set y2range [0:40]

#set arrow from 17.,-1.7 to 17.75,-1.46
#set arrow from 20.05,6 to 21.05,6.5

set title 'Umbrella EXP-17'
set xlabel 'Distance / nm'
set ylabel 'PMF / KJ/mol'
set y2label 'Density / number'
p 'profile-200-offset_y_minux_2.xvg'    u 1:2 w l lw 3 lc rgb 'black' title 'PMF'   axis x1y1,\
  'density-number.xvg' u 1:2 w l lw 1 lc rgb 'green' title 'eletr' axis x1y2,\
  'density-number.xvg' u 1:3 w l lw 1 lc rgb 'blue'  title 'nc4'   axis x1y2,\
  'density-number.xvg' u 1:4 w l lw 1 lc rgb 'red'   title 'ntf2'  axis x1y2
