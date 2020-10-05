#25.8.2020
#Script alternativo para gerar lista de escolhidos a cada X configuracoes
#O metodo tradicional eh escolher manualmente os pontos para fazer o umbrella, a partir da lista 
#summary-distances.dat que eh a saida do script anterior 1-get-distances.sh

#(1890.0000000000023, 25)
#(5180.000000000002, 50)
#(12430.000000000002, 100)
#(15730.000000000002, 50)
#(18009.999999999996, 25)

>escolhidos.dat

#19.9.2020
for i in {0..1900..25}
do
    echo $i >> escolhidos.dat
done

for i in {1950..5150..50}
do
    echo $i >> escolhidos.dat
done

for i in {5200..12400..100}
do
    echo $i >> escolhidos.dat
done

for i in {12450..15700..50}
do
    echo $i >> escolhidos.dat
done

for i in {15725..18000..25}
do
    echo $i >> escolhidos.dat
done
