set terminal png size 1000, 700
set output 'drAS0DB80-sortido.png'
#set title 'Avg. density of CO2 on bulk'

set xlabel "time / ns"
set ylabel "Avg. CO2 density / CO2 number "
p 'data.esq-sortido'  u 1:2 w p title "left"   lw 3 lc rgb "black",\
  'data.bulk-sortido' u 1:2 w p title "bulk"   lw 3 lc rgb "red"  ,\
  'data.dir-sortido'  u 1:2 w p title "right"  lw 3 lc rgb "green"
