### Rafael Guimaraes Pereira - 19.Out.2020 #####################
#
# Este programa calcula a densidade do bulk, dentro do eletrodo
# A parte em .sh calcula o numero de atomos de cada especie
# dentro de um intervalo x,y,z especificado em dx,dy e dz.
# Por causa da limitacao do .sh em trabalhar com ponto flutuante
# fizemos a calculo da densidade em Python.
################################################################

linhas=17857			#quantas linhas tem uma configuracao
amostras=5			#quantas configuracoes queremos amostrar
arquivo='dump.lammpstrj'	#nome do arquivo de trajetoria
arquivo_out='out.json'		#arquivo de saida para o programa Python
dx=3.4886			#dimensao x
dy=4.5				#dimensao y
dz=4.0				#dimensao z, aqui a gente seleciona a parte que
				#  interessa, tirando fora o eletrodo e ficando
				#  somente com o miolo.

n=$(($linhas*amostras))
#echo $n
#prepara o arquivo .xyz
tail -$n $arquivo > temp.lammpstrj

### >>> Editar aqui abaixo o intervalo em Z
cat temp.lammpstrj |awk '($8>-20)&&($8<20) {print $4,$6,$7,$8}' > temp.xyz

#conta cada um dos atomos
#salva no formato json
>$arquivo_out
echo "{" >> $arquivo_out
echo "\"amostras\": $amostras," >> $arquivo_out
echo "\"dx\": ${dx}," >> $arquivo_out
echo "\"dy\": ${dy}," >> $arquivo_out
echo "\"dz\": ${dz}," >> $arquivo_out
n_c=`cat temp.xyz |grep C|wc|awk '{print $1}'`
echo "\"C\": ${n_c}," >> $arquivo_out
n_h=`cat temp.xyz |grep H|wc|awk '{print $1}'`
echo "\"H\": ${n_h}," >> $arquivo_out
n_n=`cat temp.xyz |grep N|wc|awk '{print $1}'`
echo "\"N\": ${n_n}," >> $arquivo_out
n_o=`cat temp.xyz |grep O|wc|awk '{print $1}'`
echo "\"O\": ${n_o}," >> $arquivo_out
n_s=`cat temp.xyz |grep S|wc|awk '{print $1}'`
echo "\"S\": ${n_s}," >> $arquivo_out
n_f=`cat temp.xyz |grep F|wc|awk '{print $1}'`
echo "\"F\": ${n_f}" >> $arquivo_out
echo "}" >> $arquivo_out

#cat $arquivo_out
python densidade.py



