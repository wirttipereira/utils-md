> data.temp
> data.temp2

# distancias no bulk
# caixa sulfonio 19.8 28.24
# caixa N1114 20.15 27.85


for i in {1..62}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 20.15 27.85 >> data.temp
done


j=1
while read LINE
do
  echo "$j $LINE" >> data.temp2
  j=$(($j+1))
done < data.temp 
