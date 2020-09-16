#set term png size 1200,600
#set output '.png'

arquivo='caminho-C111'

#set multiplot layout 2, 1 #,3

#set yrange [0,10]

#set title 'Z x Y'
#set xlabel 'Distance / nm'
#set ylabel 'Position / nm'
#p arquivo u 5:4 w l
#
#set title 'Z x X'
#set xlabel 'Distance / nm'
#set ylabel 'Position / nm'
#p arquivo u 5:3 w l

set title 'X x Y'
set xlabel 'Position / nm'
set ylabel 'Position / nm'
p arquivo u 3:4 w l


