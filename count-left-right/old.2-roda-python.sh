

>data.temp
>data.bulk

python count-left-right.py >> data.temp

j=1
while read LINE
do
  echo "$j $LINE" >> data.bulk
  j=$(($j+1))
done < data.temp
