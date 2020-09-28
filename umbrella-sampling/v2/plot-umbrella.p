#set term png size 1200,600
#set output '.png'

set multiplot layout 3,2

#set yrange [0,10]

#100 bins
#set title 'Umbrella histograms - 100 bins'
#set xlabel 'Distance / nm'
set ylabel 'count (100 bins)'
p for [i=5:149] 'hist-100.xvg' u 1:i w filledcurves lc 0 notitle #w l notitle

#set title 'Umbrella Potential - 100 bins'
#set xlabel 'Position / nm'
set ylabel 'E / KJ mol'
p 'profile-100.xvg' u 1:2 w l lc 0 lt 4 notitle #w l notitle

#200 bins
#set title 'Umbrella histograms - 200 bins'
#set xlabel 'Distance / nm'
set ylabel 'count (200 bins)'
p for [i=4:149] 'hist-200.xvg' u 1:i w filledcurves lc 0 notitle #w l notitle

#set title 'Umbrella Potential - 200 bins'
#set xlabel 'Position / nm'
set ylabel 'E / KJ mol'
p 'profile-200.xvg' u 1:2 w l lc 0 lt 4 notitle #w l notitle

#400 bins
#set title 'Umbrella histograms - 100 bins'
set xlabel 'Distance / nm'
set ylabel 'count (400 bins)'
p for [i=3:149] 'hist-400.xvg' u 1:i w filledcurves lc 0 notitle #w l notitle

#set title 'Umbrella Potential - 100 bins'
set xlabel 'Position / nm'
set ylabel 'E / KJ mol'
p 'profile-400.xvg' u 1:2 w l lc 0 lt 4 notitle #w l notitle





