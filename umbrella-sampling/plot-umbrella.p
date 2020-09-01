#set term png size 1200,600
#set output 'combinado-exp5-AN2B-2ns.eq-10ns.pull-esq-dir-2ns.umbrella.png'

set multiplot layout 1,2

#set yrange [0,10]

#set title 'Umbrella histograms"
set xlabel 'Distance / nm'
set ylabel 'count'
p for [i=2:52] 'hist-200.xvg' u 1:i w l notitle

#set title 'Umbrella Potential'
set xlabel 'Position / nm'
set ylabel 'E / KJ mol'
p 'profile-200.xvg' u 1:2 w l notitle
