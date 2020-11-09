#25.8.2020
#Script alternativo para gerar lista de escolhidos a cada X configuracoes
#O metodo tradicional eh escolher manualmente os pontos para fazer o umbrella, a partir da lista 
#summary-distances.dat que eh a saida do script anterior 1-get-distances.sh

#(2189.9999999999995, 25)
#(5220.000000000001, 50)
#(17580.0, 100)
#(20600.0, 50)
#(22600.0, 25)
>escolhidos.dat

#19.9.2020
for i in {0..2200..25}
do
    echo $i >> escolhidos.dat
done

for i in {2250..5200..50}
do
    echo $i >> escolhidos.dat
done

for i in {5300..17500..100}
do
    echo $i >> escolhidos.dat
done
for i in {17550..20600..50}
do
    echo $i >> escolhidos.dat
done
for i in {20625..22600..25}
do
    echo $i >> escolhidos.dat
done

cp escolhidos.dat bk.escolhidos.dat

#
#for i in {5500..12900..100}
#do
#    echo $i >> escolhidos.dat
#done
#
#for i in {12950..16200..50}
#do
#    echo $i >> escolhidos.dat
#done
#
#for i in {16225..18000..25}
#do
#    echo $i >> escolhidos.dat
#done
