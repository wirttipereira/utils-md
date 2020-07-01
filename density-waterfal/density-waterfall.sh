<<'COMENTARIO'
7.jun.2020 - RGP

*Editar* as linhas de inicio e fim do laco 'for' para o density “e tambem do splot.

COMENTARIO


for i in {21..80}
do 
#j=$(($i+1))
begin="$(($i-1))000"
end="$(($i))000"
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx density -nice 0 -f ../deletar-apos-analise-fluxo/traj_comp.xtc -b $begin -e $end -sl 500 -o ns$(($i)) -ng 6 -s ../deletar-apos-analise-fluxo/topol.tpr -dens number<<+
2
3
4
5
6
9
+
done
#COMENTARIO

#https://unix.stackexchange.com/questions/34440/automate-gnuplot-plotting-with-bash

#for FILE in *; do
gnuplot <<- EOF
set terminal png size 1000, 1000
set output '3Dco2-plot.png'
set title 'Analise temporal de densidade do CO2'
set view 60,30,1,1
splot for [i=1:20] 'ns'.i.'.xvg' u (i):1:7 w filledcu title 'tempo ns:'.i
set view 45,90,1,1
set output '3Dco2-plot2.png'
splot for [i=1:20] 'ns'.i.'.xvg' u (i):1:7 w filledcu title 'tempo ns:'.i
EOF
#done
