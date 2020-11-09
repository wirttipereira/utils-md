#Rafael Guimaraes Pereira - 24.10.2020

cat saida.log |grep 'Step     =' |awk '{print $3}'>Step; cat saida.log |grep PotEng |awk '{print $9}'>PotEng

paste Step PotEng > out

no gnuplot:
p 'out' u 1:2 w l
