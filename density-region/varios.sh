> data.temp
> data.temp2

for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 19 30
done


j=100
while read LINE
do
  echo "$j $LINE" >> data.temp2
  j=$(($j+100))
done < data.temp 