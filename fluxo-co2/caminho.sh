


<<'COMENTARIO'
16.jun.2020 - RGP

Este programa toma como argumento um determinado atomo (um somente). Com isto ele entra em todos os arquivos de configuracoes, previamente gerados (aqui deixei comentada a rotina de geracao dos .gro e .txt pois eles eu já gerei no outro programa, fluxo.sh/fluxo.py) e pega as coordenadas 'y' e 'z'. No arquivo de saida ele tambem grava o tempo em ps de cada coordenada yz.

Depois de gerar os dois arquivos de saida (um somente com yz e o outro com tempo, y e z) eh possivel plotar os graficos. 

Neste diretorio temos tambem o 'caminho.p' para plotar os dados utilizando o gnuplot.

chamar o programa da seguinte forma:

$sh caminho.sh 19
'19' aqui é o numero/indice do atomo, no caso um carbono.

COMENTARIO


# zera o arquivo temporario dos resultados finais data.temp
> caminho.temp
> caminho.temp2

# cria copia do .gro para .txt e retira as 2 primeiras e a ultima linha
for i in {100..80000..100}
do
# cp ns$i.gro ns$i.txt
 # tirar as 2 primeiras linhas e 1 linha do final
# tail -n +3 ns$i.txt | head -n -1 > file.new && mv file.new ns$i.txt
 # adicionar ; nas colunas
# sed -i 's/./&;/36;s/./&;/28;s/./&;/20;s/./&;/15;s/./&;/8' ns$i.txt
 # roda o script python e adiciona o resultado, linha por linha, no data.temp 
 python caminho.py ns$i.txt $1>> caminho.temp
done
# retira os colchetes gerados pelo script fluxo.py
sed -i '1,$s/(//g' caminho.temp
sed -i '1,$s/)//g' caminho.temp

#COMENTARIO

# adiciona a numeracao de tempo na primeira coluna do arquivo consolidado data.temp e grava no 'data.temp2'
j=100
while read LINE
do
  echo "$j $LINE" >> caminho.temp2
  j=$(($j+100))
done < caminho.temp 

cp caminho.temp caminho.atomo$1
cp caminho.temp2 caminho3D.atomo$1

#for FILE in *; do
#gnuplot <<- EOF
#set terminal png size 1000, 1000
#set output 'caminho.png'
#set title 'Analise temporal de densidade do CO2'
#set view 60,30,1,1
#plot 'data.temp2' u 1:7  title 'bulk'  
#EOF
#done

#COMMENT2

