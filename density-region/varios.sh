> data.temp
> data.temp2

for i in {1..80}
do
python density-region.py  ../density-waterfal/ns$(($i)).xvg 19.8 28.24 >> data.temp
done


j=1
while read LINE
do
  echo "$j $LINE" >> data.temp2
  j=$(($j+1))
done < data.temp 
