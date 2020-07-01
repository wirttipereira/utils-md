#17.6.2020 - RGP

#nome="947"

#o numero do atomo sera passado atraves de argumento na chamada o script
#exemplo: $gnuplot -e "nome=100" caminho.p
#exemplo 2: dentro do gnuplot: load -e "nome=100" caminho.p


#set terminal png size 1600, 900 #1920, 1080
#set terminal png size 1000, 1000 #1920, 1080
set terminal x11 size 1000,1000
set output 'caminho.atomo'.nome.'.png'

set multiplot layout 2,2;

#1
set title "Tempo vs Y";
# tempo vs Y
plot 'caminho3D.atomo'.nome u 1:2 lc 3 w linespoints notitle ##, 1.5 lc 1, 2.25 lc 1, 3.75 lc 1

#3
set title "Z vs Y";
##set arrow from 17, graph 0 to 17, graph 1 nohead 
##set arrow from 19, graph 0 to 19, graph 1 nohead
##set arrow from 30, graph 0 to 30, graph 1 nohead
##set arrow from 32, graph 0 to 32, graph 1 nohead
plot 'caminho3D.atomo'.nome u 3:2 lc 3 notitle ##, 1.5 lc 1, 2.25 lc 1, 3.75 lc 1

#2
set title "Tempo vs Z";
# tempo vs Z
plot 'caminho3D.atomo'.nome u 1:3 lc 3 w linespoints notitle ##,17 lc 1, 19 lc 1,30 lc 1,32 lc 1


#4
#set title "Y vs Z";
#plot 'caminho3D.atomo'.nome u 2:3
