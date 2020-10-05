#Rafael Guimaraes Pereira - 12.9.2020

file="bk.escolhidos.dat"
atomo="C111"

>temp
>temp2

while IFS= read line 
do
	tail ./gro/conf$line.gro | grep $atomo | cut -b 6-9,21-28,29-36,37-44 >> temp
	echo "$line" >>temp2
	paste temp2 temp > caminho-$atomo
done<"$file"
rm temp
rm temp2

