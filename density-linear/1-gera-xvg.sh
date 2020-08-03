<<'COMENTARIO'
24.jul.2020 - RGP
*Editar* as linhas de inicio e fim do laco 'for' para o density “e tambem do splot.
COMENTARIO

j=1
for i in 250 750 1750 2750 4750 7250 9750 14750 19250 24750 29750
do 
begin="$(($i))"
end="$(($i+500))"
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx density -nice 0 -f ../traj_comp.xtc -b $begin -e $end -sl 500 -o $(($j))ns$(($i)) -ng 5 -s ../topol.tpr -dens number<<+
2
3
4
5
6
+
j=$j+1
done

#j=12
for i in 39250 49250 59250 69250 79250
do 
begin="$(($i))"
end="$(($i+1000))"
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx density -nice 0 -f ../traj_comp.xtc -b $begin -e $end -sl 500 -o $(($j))ns$(($i)) -ng 5 -s ../topol.tpr -dens number<<+
2
3
4
5
6
+
j=$j+1
done

#o restante estah em outro diretorio
#la o tempo comecao do zero, entao tem que adaptar
for i in 9250 19250 #89250 99000 
do 
begin="$(($i))"
end="$(($i+1000))"
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx density -nice 0 -f ../2/traj_comp.xtc -b $begin -e $end -sl 500 -o $(($j))ns$(($i+80000)) -ng 5 -s ../2/topol.tpr -dens number<<+
2
3
4
5
6
+
j=$j+1
done

