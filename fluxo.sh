<<'COMENTARIO'
7.jun.2020 - RGP

*Editar* as linhas de inicio e fim do laco 'for' para o density “e tambem do splot.

#COMENTARIO

# geracao das configuracoes .gro 
#for i in {100..30000..100}
for i in {27000..48000..100}
do 
/home/rafagp/exe/gromacs-5.1.4/build/bin/./gmx trjconv -nice 0 -f ../traj_comp.xtc -b $i -e $i -o ns$i.gro  -s ../topol.tpr<<+
9
+
done
COMENTARIO

# zera o arquivo temporario dos resultados finais data.temp
> data.temp
> data.temp2

# cria copia do .gro para .txt e retira as 2 primeiras e a ultima linha
for i in {100..48000..100}
do
 cp ns$i.gro ns$i.txt
 # tirar as 2 primeiras linhas e 1 linha do final
 tail -n +3 ns$i.txt | head -n -1 > file.new && mv file.new ns$i.txt
 # adicionar ; nas colunas
 sed -i 's/./&;/36;s/./&;/28;s/./&;/20;s/./&;/15;s/./&;/8' ns$i.txt
 # roda o script python e adiciona o resultado, linha por linha, no data.temp 
 python fluxo.py ns$i.txt >> data.temp
done
# retira os colchetes gerados pelo script fluxo.py
sed -i '1,$s/\]//g' data.temp
sed -i '1,$s/\[//g' data.temp

#COMENTARIO

# adiciona a numeracao de tempo na primeira coluna do arquivo consolidado data.temp e grava no 'data.temp2'
j=100
while read LINE
do
  echo "$j $LINE" >> data.temp2
  j=$(($j+100))
done < data.temp 

#COMENTARIO

#<<'COMMENT2'
#https://unix.stackexchange.com/questions/34440/automate-gnuplot-plotting-with-bash

#for FILE in *; do
gnuplot <<- EOF
set terminal png size 1000, 1000
set output 'bulk.png'
set title 'Analise temporal de densidade do CO2'
set view 60,30,1,1
plot 'data.temp2' u 1:7  title 'bulk'  
EOF
#done

#COMMENT2

