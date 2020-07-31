> data.temp
> data.bulk
> data.esq
> data.dir

#inicio bulk: 19.8
#final do bulk: 28.24
#ponto medio: 24.02

#bulk
for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 19.8 28.24 >> data.temp
done
j=1
while read LINE
do
  echo "$j $LINE" >> data.bulk
  j=$(($j+1))
done < data.temp

>data.temp
#esquerda
for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 19.8 24.02 >> data.temp
done
j=1
while read LINE
do
  echo "$j $LINE" >> data.esq
  j=$(($j+1))
done < data.temp

>data.temp
#direita
 for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 24.02 28.24 >> data.temp
done
j=1
while read LINE
do
  echo "$j $LINE" >> data.dir
  j=$(($j+1))
done < data.temp

