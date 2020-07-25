#24.7.2020 - RGP

#uso
#sh d-linear.sh *xvg

gnuplot -p <<eof
set term x11 size 1200,900 title 'XXXXXXX'
set xlabel 'Z / nm'
set ylabel 'Number density / nm-3'
p for [file in "$@"] file u 1:5 w l title file
eof
