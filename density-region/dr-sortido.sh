> data.temp
> data.bulk-sortido
> data.esq-sortido
> data.dir-sortido

#inicio bulk: 19.8
#final do bulk: 28.24
#ponto medio: 24.02

#bulk
for i in 01ns250 02ns750 03ns1750 04ns2750 05ns4750 06ns7250 07ns9750 08ns14750 09ns19250 10ns24750 11ns29750 12ns39250 13ns49250 14ns59250 15ns69250 16ns80250 17ns90250 18ns99000 
do
python density-region.py  ../density-linear/$i.xvg 19.8 28.24 >> data.temp
done

#arquivo tempos contem os intervalos de tempo desejados que sao os tempos medios de 500 ou 1000ps obtidos no density-linear
paste -d' ' tempos data.temp > data.bulk-sortido

>data.temp
#esquerda
for i in 01ns250 02ns750 03ns1750 04ns2750 05ns4750 06ns7250 07ns9750 08ns14750 09ns19250 10ns24750 11ns29750 12ns39250 13ns49250 14ns59250 15ns69250 16ns80250 17ns90250 18ns99000 
do
python density-region.py  ../density-linear/$i.xvg 19.8 24.02 >> data.temp
done
paste -d' ' tempos data.temp > data.esq-sortido

>data.temp
#direita
 for i in 01ns250 02ns750 03ns1750 04ns2750 05ns4750 06ns7250 07ns9750 08ns14750 09ns19250 10ns24750 11ns29750 12ns39250 13ns49250 14ns59250 15ns69250 16ns80250 17ns90250 18ns99000 
do
python density-region.py  ../density-linear/$i.xvg 24.02 28.24 >> data.temp
done
paste -d' ' tempos data.temp > data.dir-sortido

