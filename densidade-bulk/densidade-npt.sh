#### Rafael Guimaraes Pereira - 20.Out.2020 ######################################
#
# Calcula a densidade media dos ultimos 'i' pontos
# O arquivo de entrada (saida.log) ja tem a densidade na 12a coluna.
# O que fizemos foi criar uma copia do arquivo, retirando o cabecalho e o rodape
##################################################################################

# tirar o cabecalho e rodape
head -n -50 saida.log|tail -n +107 >aux
#captura numero de linhas
N=$(wc aux |awk '{print $1}') # >N
echo $N
#pega a metade das linhas
metade=$(($N/2))
#faz a media da densidade ($12) para todas as linhas
echo $metade
tail -$metade aux | awk -v var="$metade" '{sum += $12} END {print sum/var}' > dens.out
cat dens.out
#rm aux
