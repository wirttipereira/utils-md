#set term png size 1200,600
#set output '.png'

#set multiplot layout 3,2

set xrange [15:33] 
set yrange [-10:60]

#set title 'Umbrella histograms - 100 bins'
set xlabel 'Distance / nm'
set ylabel 'PMF / KJ/mol'
#p for [i=5:149] 'hist-100.xvg' u 1:i w filledcurves lc 0 notitle #w l notitle
p 'out_offset.dat'         u 1:2 w l lw 3 notitle,\
  '../caminho/density.xvg' u 1:4 w l lc 0 notitle,\
  '../caminho/density.xvg' u 1:5 w l lc 0 notitle
