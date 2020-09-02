#set term png size 1200,600
#set output 'pullx.pullf-expXX-AN0B-2ns.eq-10ns.pull.esqXX.dirXX.png'

set multiplot layout 1,2

#set yrange [0,10]

set xlabel 'Time / ps'
set ylabel 'Position / nm'
p 'pullx.xvg' u 1:2 w l

set xlabel 'Time / ps'
set ylabel 'Force / KJ/mol/nm'
p 'pullf.xvg' u 1:2 w l
