#!/bin/bash
#Rafael Guimaraes - 5.10.2020
#
#Primeiro tem que preparar uma listagem dos arquivos (so o numero) que estao faltando.
#Normalmente eh mais fácil fazer isto comparando, usando a ferramenta 'diff -y arquivo1 arquivo2'.
#Depois salvei o que precisa ser baixado no 'faltaxtc' mas pode ser qualquer nome, eh soh ajustar aqui no 'file'.

file='bk.escolhidos.dat'  #"faltaxtc"

>baixa.sh
echo '#RGP 5.10.2020' >> baixa.sh
echo '#Digitar o seguinte na linha de comando: ' >> baixa.sh
echo '#nohup sftp -b baixa.sh -P 2122 rafagp@eniac.iqsc.usp.br &' >> baixa.sh
echo 'cd temp/17' >> baixa.sh

while IFS= read line 
do
	#echo get conf$line.edr >> baixa.sh
	#echo get conf$line.xtc >> baixa.sh
	echo put run$line.pbs >> baixa.sh
	echo put conf$line.tpr >> baixa.sh
	
done<"$file"
echo 'exit' >> baixa.sh
