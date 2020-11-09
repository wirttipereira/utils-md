#### Rafael Guimaraes Pereira - 20.Out.2020 ######################################
#
# Calcula a densidade media dos ultimos 'i' pontos
# O arquivo de entrada (saida.log) ja tem a densidade na 12a coluna.
# O que fizemos foi criar uma copia do arquivo, retirando o cabecalho e o rodape
##################################################################################

cp saida.log saida-sem-header.log
# tirar o cabecalho e rodape
tail -100 saida-sem-header.log | awk '{sum += $12} END {print sum/100}'
