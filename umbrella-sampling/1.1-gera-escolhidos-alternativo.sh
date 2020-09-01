#25.8.2020
#Script alternativo para gerar lista de escolhidos a cada X configuracoes
#O metodo tradicional eh escolher manualmente os pontos para fazer o umbrella, a partir da lista 
#summary-distances.dat que eh a saida do script anterior 1-get-distances.sh

>escolhidos.dat

for i in {0..10000..200}
do
    echo $i >> escolhidos.dat
done
